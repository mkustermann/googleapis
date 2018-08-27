import 'dart:async';
import 'dart:io';

import 'package:kernel/ast.dart';
import 'package:kernel/kernel.dart';
import 'package:path/path.dart' as path;

// For invoking
// pkg/front_end/tool/fasta compile -o pkg/compiler/lib/src/dart2js.dill --platform=out/ReleaseX64/patched_sdk/platform.dill pkg/compiler/lib/src/dart2js.dart

final String sdkDir = Platform.script.resolve('../../sdk-gclient/sdk').toFilePath();
final String kFataPlatform = '$sdkDir/out/ReleaseX64/vm_platform_strong.dill';
final String kFastaPath = '$sdkDir/pkg/front_end/tool/fasta';

main(args) async {
  if (args.isEmpty) {
    throw 'Usage: before/after/compare';
  }
  final bool before = args[0] == 'before';
  final bool after = args[0] == 'after';
  final bool compare = args[0] == 'compare';

  if (!before && !after && !compare) {
    throw 'Usage: before/after/compare';
  }

  if (before || after) {
    if (before) {
      final dir = new Directory('kernel');
      if (dir.existsSync()) {
        dir.deleteSync(recursive: true);
      }
    }

    for (final dir in ['googleapis', 'googleapis_beta']) {
      final libDir = new Directory('generated/$dir/lib');
      var futures = <Future>[];
      await for (var fse in libDir.list(recursive: true)) {
        if (fse is File) {
          futures.add(compileIt(dir, fse, before));
          if (futures.length == 20) {
            await Future.wait(futures);
            futures = [];
          }
        }
      }
      await Future.wait(futures);
    }
  }

  if (compare) {
    for (final dir in ['googleapis', 'googleapis_beta']) {
      print('$dir:');
      final before = await scan('kernel/$dir/lib', 'before');
      final after = await scan('kernel/$dir/lib', 'after');

      final removed = new Set();
      final added = new Set();

      for (final api in before.keys) {
        if (!after.containsKey(api)) removed.add(api);
      }
      for (final api in after.keys) {
        if (!before.containsKey(api)) added.add(api);
      }

      for (var api in added) {
        print('[api-new] ${api.name}:${api.version}');
      }
      for (var apiAfter in after.keys) {
        if (!added.contains(apiAfter)) {
          var apiBefore = before[apiAfter];

          final changes = compareApis(apiBefore, apiAfter);
          if (changes.breaking.isNotEmpty) {
            print('[api-breaking] ${apiAfter.name}:${apiAfter.version}: Breaking ${changes.breaking.join(', ')}');
          }

          if (changes.removed.isNotEmpty) {
            print('[api-breaking] ${apiAfter.name}:${apiAfter.version}: Removed ${changes.removed.join(', ')}');
          }
          if (changes.added.isNotEmpty) {
            print('[api] ${apiAfter.name}:${apiAfter.version}: New ${changes.added.join(', ')}');
          }
        }
      }
      for (var api in removed) {
        print('[api-removed] ${api.name}:${api.version}');
      }
      print('');
    }
  }
}

class ApiVersion {
  final String name;
  final String version;
  final String file;
  ApiVersion(this.name, this.version, this.file);

  toString() => 'ApiVersion($name, $version, $file)';

  operator==(other) {
    return other is ApiVersion && other.name == name && other.version == version;
  }

  get hashCode => name.hashCode ^ version.hashCode;
}

compileIt(String dir, File fse, bool before) async {
  final String dartFile = fse.path;
  final String name = path.basename(fse.path);
  final String apiname = path.basename(path.dirname(fse.path));
  final String kernelFile = 'kernel/$dir/lib/$apiname/$name.${before ? "before" : "after" }.dill';

  final String packagesFile = '${fse.parent.parent.parent.path}/.packages';

  final Directory directory = new Directory(path.dirname(kernelFile));
  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }

  final args = [ 'compile', '-o', kernelFile, '--platform=$kFataPlatform',
                 '--packages=$packagesFile', dartFile ];
  print('Running dart $args');
  final result = await Process.run(kFastaPath, args);
  if (result.stderr.trim().length > 0 ||
      result.exitCode != 0) {
    throw 'Failed to run dart $args\n${result.stdout}, ${result.stderr}';
  }
}

scan(String dir, String postfix) async {
  var map = {};
  await for (final fse in new Directory(dir).list(recursive: true)) {
    if (fse is File) {
      final String basename = path.basename(fse.path);
      if (basename.endsWith('$postfix.dill')) {
        final String apiname = path.basename(path.dirname(fse.path));
        var parts = basename.split('.');
        parts.length = parts.length - 2;

        final String versionName = parts.take(parts.length - 1).join('.');
        final api = new ApiVersion(apiname, versionName, fse.path);
        map[api] = api;
      }
    }
  }
  return map;
}

compareApis(ApiVersion before, ApiVersion after) {
  var beforeLib = searchLibrary(loadComponentFromBinary(before.file));
  var afterLib = searchLibrary(loadComponentFromBinary(after.file));

  return compareLibrary(beforeLib, afterLib);
}

Library searchLibrary(Component program) {
  var libs = program.libraries.where((Library lib) {
    return lib.importUri.scheme == 'file';
  }).toList();
  if (libs.length != 1) {
    throw "Could not find APi library in program";
  }
  return libs[0];
}

compareLibrary(Library before, Library after) {
  Map<String, NamedNode> libraryMembers(Library lib) {
    var map = <String, NamedNode>{};

    lib.fields.forEach((m) => map[m.name.name] = m);
    lib.procedures.forEach((m) => map[m.name.name] = m);
    lib.classes.forEach((m) => map[m.name] = m);

    return map;
  }

  classMembers(Class klass) {
    var map = <String, Member>{};

    klass.fields.forEach((m) => map[m.name.name] = m);
    klass.procedures.forEach((m) => map[m.name.name] = m);

    return map;
  }

  final beforeMembers = libraryMembers(before);
  final afterMembers = libraryMembers(after);

  final removedMembers = [];
  final addedMembers = [];
  final breakingChanges = [];

  beforeMembers.forEach((String name, member) {
    var other = afterMembers[name];
    if (other == null) {
      removedMembers.add('${after.name}::$name');
    }
  });

  afterMembers.forEach((String name, member) {
    var other = beforeMembers[name];
    if (other == null) {
      addedMembers.add(name);
    }
  });

  compareClasses(Class before, Class after) {
    var beforeMembers = classMembers(before);
    var afterMembers = classMembers(after);

    beforeMembers.forEach((String name, Member member) {
      var other = afterMembers[name];
      if (other == null) {
        removedMembers.add('${after.name}::$name');
      }
    });

    afterMembers.forEach((String name, Member member) {
      var other = beforeMembers[name];
      if (other == null) {
        addedMembers.add(name);
      }
    });

    afterMembers.forEach((String name, Member member) {
      var other = beforeMembers[name];
      if (other != null) {
        if (other.runtimeType != member.runtimeType) {
          throw 'unexpected member type';
        }

        if (member is Field) {
          Field otherField = other;
          if (member.type.toString() != otherField.type.toString()) {
            breakingChanges.add('${after.name}::${member.name} changed type (${member.type} -> ${otherField.type})');
          }
        } else if (member is Procedure) {
          final FunctionNode from = other.function;
          final FunctionNode to = member.function;
          if (from.positionalParameters.length > to.positionalParameters.length) {
            removedMembers.add('${after.name}::${member.name}');
            return;
          }
          for (int i = 0; i < from.positionalParameters.length; i++) {
            if (from.positionalParameters[i].type.toString() !=
                to.positionalParameters[i].type.toString()) {
              breakingChanges.add('${after.name}::${member.name}');
            }
          }
          for (final VariableDeclaration named in from.namedParameters) {
            if (!to.namedParameters.any((VariableDeclaration now) {
              if (named.name == now.name &&
                  named.type.toString() == now.type.toString()) {
                return true;
              }
              return false;
            })) {
              breakingChanges.add('Incompatible named parameter change');
            }
          }
        }
      }
    });
  }

  afterMembers.forEach((String name, member) {
    final NamedNode before = beforeMembers[name];
    if (before != null) {
      if (before is Class && member is Class) {
        compareClasses(before, member);
      }
      if (before.runtimeType != member.runtimeType) {
        throw 'unexpected type change ${before.runtimeType} -> ${member.runtimeType}';
      }
      if (member is Procedure && member.name.name != '#main') {
        throw 'unexpected $before / $member type change ${before} -> ${member.name} ${(before as Member).enclosingLibrary.importUri}';
      }
      if (member is Field && member.name.name != 'USER_AGENT') {
        throw 'unexpected $before / $member type change ${before.runtimeType} -> ${member.runtimeType}';
      }
    }
  });

  return new Changes(addedMembers, removedMembers, breakingChanges);
}

class Changes {
  final added, removed, breaking;
  Changes(this.added, this.removed, this.breaking);

  String toString() {
    return 'Added: $added\nRemoved: $removed\nbreaking: $breaking';
  }
}
