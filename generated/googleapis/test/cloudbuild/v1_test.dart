library googleapis.cloudbuild.v1.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/cloudbuild/v1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request
          .finalize()
          .transform(convert.utf8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.json.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(core.int status,
    core.Map<core.String, core.String> headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.utf8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

buildUnnamed1614() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1614(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterArtifactObjects = 0;
buildArtifactObjects() {
  var o = new api.ArtifactObjects();
  buildCounterArtifactObjects++;
  if (buildCounterArtifactObjects < 3) {
    o.location = "foo";
    o.paths = buildUnnamed1614();
    o.timing = buildTimeSpan();
  }
  buildCounterArtifactObjects--;
  return o;
}

checkArtifactObjects(api.ArtifactObjects o) {
  buildCounterArtifactObjects++;
  if (buildCounterArtifactObjects < 3) {
    unittest.expect(o.location, unittest.equals('foo'));
    checkUnnamed1614(o.paths);
    checkTimeSpan(o.timing);
  }
  buildCounterArtifactObjects--;
}

buildUnnamed1615() {
  var o = new core.List<api.FileHashes>();
  o.add(buildFileHashes());
  o.add(buildFileHashes());
  return o;
}

checkUnnamed1615(core.List<api.FileHashes> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFileHashes(o[0]);
  checkFileHashes(o[1]);
}

core.int buildCounterArtifactResult = 0;
buildArtifactResult() {
  var o = new api.ArtifactResult();
  buildCounterArtifactResult++;
  if (buildCounterArtifactResult < 3) {
    o.fileHash = buildUnnamed1615();
    o.location = "foo";
  }
  buildCounterArtifactResult--;
  return o;
}

checkArtifactResult(api.ArtifactResult o) {
  buildCounterArtifactResult++;
  if (buildCounterArtifactResult < 3) {
    checkUnnamed1615(o.fileHash);
    unittest.expect(o.location, unittest.equals('foo'));
  }
  buildCounterArtifactResult--;
}

buildUnnamed1616() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1616(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterArtifacts = 0;
buildArtifacts() {
  var o = new api.Artifacts();
  buildCounterArtifacts++;
  if (buildCounterArtifacts < 3) {
    o.images = buildUnnamed1616();
    o.objects = buildArtifactObjects();
  }
  buildCounterArtifacts--;
  return o;
}

checkArtifacts(api.Artifacts o) {
  buildCounterArtifacts++;
  if (buildCounterArtifacts < 3) {
    checkUnnamed1616(o.images);
    checkArtifactObjects(o.objects);
  }
  buildCounterArtifacts--;
}

buildUnnamed1617() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1617(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed1618() {
  var o = new core.List<api.Secret>();
  o.add(buildSecret());
  o.add(buildSecret());
  return o;
}

checkUnnamed1618(core.List<api.Secret> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSecret(o[0]);
  checkSecret(o[1]);
}

buildUnnamed1619() {
  var o = new core.List<api.BuildStep>();
  o.add(buildBuildStep());
  o.add(buildBuildStep());
  return o;
}

checkUnnamed1619(core.List<api.BuildStep> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBuildStep(o[0]);
  checkBuildStep(o[1]);
}

buildUnnamed1620() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed1620(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

buildUnnamed1621() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1621(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed1622() {
  var o = new core.Map<core.String, api.TimeSpan>();
  o["x"] = buildTimeSpan();
  o["y"] = buildTimeSpan();
  return o;
}

checkUnnamed1622(core.Map<core.String, api.TimeSpan> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTimeSpan(o["x"]);
  checkTimeSpan(o["y"]);
}

core.int buildCounterBuild = 0;
buildBuild() {
  var o = new api.Build();
  buildCounterBuild++;
  if (buildCounterBuild < 3) {
    o.artifacts = buildArtifacts();
    o.buildTriggerId = "foo";
    o.createTime = "foo";
    o.finishTime = "foo";
    o.id = "foo";
    o.images = buildUnnamed1617();
    o.logUrl = "foo";
    o.logsBucket = "foo";
    o.options = buildBuildOptions();
    o.projectId = "foo";
    o.results = buildResults();
    o.secrets = buildUnnamed1618();
    o.source = buildSource();
    o.sourceProvenance = buildSourceProvenance();
    o.startTime = "foo";
    o.status = "foo";
    o.statusDetail = "foo";
    o.steps = buildUnnamed1619();
    o.substitutions = buildUnnamed1620();
    o.tags = buildUnnamed1621();
    o.timeout = "foo";
    o.timing = buildUnnamed1622();
  }
  buildCounterBuild--;
  return o;
}

checkBuild(api.Build o) {
  buildCounterBuild++;
  if (buildCounterBuild < 3) {
    checkArtifacts(o.artifacts);
    unittest.expect(o.buildTriggerId, unittest.equals('foo'));
    unittest.expect(o.createTime, unittest.equals('foo'));
    unittest.expect(o.finishTime, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed1617(o.images);
    unittest.expect(o.logUrl, unittest.equals('foo'));
    unittest.expect(o.logsBucket, unittest.equals('foo'));
    checkBuildOptions(o.options);
    unittest.expect(o.projectId, unittest.equals('foo'));
    checkResults(o.results);
    checkUnnamed1618(o.secrets);
    checkSource(o.source);
    checkSourceProvenance(o.sourceProvenance);
    unittest.expect(o.startTime, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.statusDetail, unittest.equals('foo'));
    checkUnnamed1619(o.steps);
    checkUnnamed1620(o.substitutions);
    checkUnnamed1621(o.tags);
    unittest.expect(o.timeout, unittest.equals('foo'));
    checkUnnamed1622(o.timing);
  }
  buildCounterBuild--;
}

core.int buildCounterBuildOperationMetadata = 0;
buildBuildOperationMetadata() {
  var o = new api.BuildOperationMetadata();
  buildCounterBuildOperationMetadata++;
  if (buildCounterBuildOperationMetadata < 3) {
    o.build = buildBuild();
  }
  buildCounterBuildOperationMetadata--;
  return o;
}

checkBuildOperationMetadata(api.BuildOperationMetadata o) {
  buildCounterBuildOperationMetadata++;
  if (buildCounterBuildOperationMetadata < 3) {
    checkBuild(o.build);
  }
  buildCounterBuildOperationMetadata--;
}

buildUnnamed1623() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1623(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterBuildOptions = 0;
buildBuildOptions() {
  var o = new api.BuildOptions();
  buildCounterBuildOptions++;
  if (buildCounterBuildOptions < 3) {
    o.diskSizeGb = "foo";
    o.logStreamingOption = "foo";
    o.machineType = "foo";
    o.requestedVerifyOption = "foo";
    o.sourceProvenanceHash = buildUnnamed1623();
    o.substitutionOption = "foo";
  }
  buildCounterBuildOptions--;
  return o;
}

checkBuildOptions(api.BuildOptions o) {
  buildCounterBuildOptions++;
  if (buildCounterBuildOptions < 3) {
    unittest.expect(o.diskSizeGb, unittest.equals('foo'));
    unittest.expect(o.logStreamingOption, unittest.equals('foo'));
    unittest.expect(o.machineType, unittest.equals('foo'));
    unittest.expect(o.requestedVerifyOption, unittest.equals('foo'));
    checkUnnamed1623(o.sourceProvenanceHash);
    unittest.expect(o.substitutionOption, unittest.equals('foo'));
  }
  buildCounterBuildOptions--;
}

buildUnnamed1624() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1624(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed1625() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1625(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed1626() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1626(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed1627() {
  var o = new core.List<api.Volume>();
  o.add(buildVolume());
  o.add(buildVolume());
  return o;
}

checkUnnamed1627(core.List<api.Volume> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVolume(o[0]);
  checkVolume(o[1]);
}

buildUnnamed1628() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1628(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterBuildStep = 0;
buildBuildStep() {
  var o = new api.BuildStep();
  buildCounterBuildStep++;
  if (buildCounterBuildStep < 3) {
    o.args = buildUnnamed1624();
    o.dir = "foo";
    o.entrypoint = "foo";
    o.env = buildUnnamed1625();
    o.id = "foo";
    o.name = "foo";
    o.secretEnv = buildUnnamed1626();
    o.status = "foo";
    o.timeout = "foo";
    o.timing = buildTimeSpan();
    o.volumes = buildUnnamed1627();
    o.waitFor = buildUnnamed1628();
  }
  buildCounterBuildStep--;
  return o;
}

checkBuildStep(api.BuildStep o) {
  buildCounterBuildStep++;
  if (buildCounterBuildStep < 3) {
    checkUnnamed1624(o.args);
    unittest.expect(o.dir, unittest.equals('foo'));
    unittest.expect(o.entrypoint, unittest.equals('foo'));
    checkUnnamed1625(o.env);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed1626(o.secretEnv);
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.timeout, unittest.equals('foo'));
    checkTimeSpan(o.timing);
    checkUnnamed1627(o.volumes);
    checkUnnamed1628(o.waitFor);
  }
  buildCounterBuildStep--;
}

buildUnnamed1629() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed1629(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterBuildTrigger = 0;
buildBuildTrigger() {
  var o = new api.BuildTrigger();
  buildCounterBuildTrigger++;
  if (buildCounterBuildTrigger < 3) {
    o.build = buildBuild();
    o.createTime = "foo";
    o.description = "foo";
    o.disabled = true;
    o.filename = "foo";
    o.id = "foo";
    o.substitutions = buildUnnamed1629();
    o.triggerTemplate = buildRepoSource();
  }
  buildCounterBuildTrigger--;
  return o;
}

checkBuildTrigger(api.BuildTrigger o) {
  buildCounterBuildTrigger++;
  if (buildCounterBuildTrigger < 3) {
    checkBuild(o.build);
    unittest.expect(o.createTime, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.disabled, unittest.isTrue);
    unittest.expect(o.filename, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed1629(o.substitutions);
    checkRepoSource(o.triggerTemplate);
  }
  buildCounterBuildTrigger--;
}

core.int buildCounterBuiltImage = 0;
buildBuiltImage() {
  var o = new api.BuiltImage();
  buildCounterBuiltImage++;
  if (buildCounterBuiltImage < 3) {
    o.digest = "foo";
    o.name = "foo";
    o.pushTiming = buildTimeSpan();
  }
  buildCounterBuiltImage--;
  return o;
}

checkBuiltImage(api.BuiltImage o) {
  buildCounterBuiltImage++;
  if (buildCounterBuiltImage < 3) {
    unittest.expect(o.digest, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkTimeSpan(o.pushTiming);
  }
  buildCounterBuiltImage--;
}

core.int buildCounterCancelBuildRequest = 0;
buildCancelBuildRequest() {
  var o = new api.CancelBuildRequest();
  buildCounterCancelBuildRequest++;
  if (buildCounterCancelBuildRequest < 3) {}
  buildCounterCancelBuildRequest--;
  return o;
}

checkCancelBuildRequest(api.CancelBuildRequest o) {
  buildCounterCancelBuildRequest++;
  if (buildCounterCancelBuildRequest < 3) {}
  buildCounterCancelBuildRequest--;
}

core.int buildCounterCancelOperationRequest = 0;
buildCancelOperationRequest() {
  var o = new api.CancelOperationRequest();
  buildCounterCancelOperationRequest++;
  if (buildCounterCancelOperationRequest < 3) {}
  buildCounterCancelOperationRequest--;
  return o;
}

checkCancelOperationRequest(api.CancelOperationRequest o) {
  buildCounterCancelOperationRequest++;
  if (buildCounterCancelOperationRequest < 3) {}
  buildCounterCancelOperationRequest--;
}

core.int buildCounterEmpty = 0;
buildEmpty() {
  var o = new api.Empty();
  buildCounterEmpty++;
  if (buildCounterEmpty < 3) {}
  buildCounterEmpty--;
  return o;
}

checkEmpty(api.Empty o) {
  buildCounterEmpty++;
  if (buildCounterEmpty < 3) {}
  buildCounterEmpty--;
}

buildUnnamed1630() {
  var o = new core.List<api.Hash>();
  o.add(buildHash());
  o.add(buildHash());
  return o;
}

checkUnnamed1630(core.List<api.Hash> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHash(o[0]);
  checkHash(o[1]);
}

core.int buildCounterFileHashes = 0;
buildFileHashes() {
  var o = new api.FileHashes();
  buildCounterFileHashes++;
  if (buildCounterFileHashes < 3) {
    o.fileHash = buildUnnamed1630();
  }
  buildCounterFileHashes--;
  return o;
}

checkFileHashes(api.FileHashes o) {
  buildCounterFileHashes++;
  if (buildCounterFileHashes < 3) {
    checkUnnamed1630(o.fileHash);
  }
  buildCounterFileHashes--;
}

core.int buildCounterHash = 0;
buildHash() {
  var o = new api.Hash();
  buildCounterHash++;
  if (buildCounterHash < 3) {
    o.type = "foo";
    o.value = "foo";
  }
  buildCounterHash--;
  return o;
}

checkHash(api.Hash o) {
  buildCounterHash++;
  if (buildCounterHash < 3) {
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterHash--;
}

buildUnnamed1631() {
  var o = new core.List<api.BuildTrigger>();
  o.add(buildBuildTrigger());
  o.add(buildBuildTrigger());
  return o;
}

checkUnnamed1631(core.List<api.BuildTrigger> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBuildTrigger(o[0]);
  checkBuildTrigger(o[1]);
}

core.int buildCounterListBuildTriggersResponse = 0;
buildListBuildTriggersResponse() {
  var o = new api.ListBuildTriggersResponse();
  buildCounterListBuildTriggersResponse++;
  if (buildCounterListBuildTriggersResponse < 3) {
    o.triggers = buildUnnamed1631();
  }
  buildCounterListBuildTriggersResponse--;
  return o;
}

checkListBuildTriggersResponse(api.ListBuildTriggersResponse o) {
  buildCounterListBuildTriggersResponse++;
  if (buildCounterListBuildTriggersResponse < 3) {
    checkUnnamed1631(o.triggers);
  }
  buildCounterListBuildTriggersResponse--;
}

buildUnnamed1632() {
  var o = new core.List<api.Build>();
  o.add(buildBuild());
  o.add(buildBuild());
  return o;
}

checkUnnamed1632(core.List<api.Build> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBuild(o[0]);
  checkBuild(o[1]);
}

core.int buildCounterListBuildsResponse = 0;
buildListBuildsResponse() {
  var o = new api.ListBuildsResponse();
  buildCounterListBuildsResponse++;
  if (buildCounterListBuildsResponse < 3) {
    o.builds = buildUnnamed1632();
    o.nextPageToken = "foo";
  }
  buildCounterListBuildsResponse--;
  return o;
}

checkListBuildsResponse(api.ListBuildsResponse o) {
  buildCounterListBuildsResponse++;
  if (buildCounterListBuildsResponse < 3) {
    checkUnnamed1632(o.builds);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListBuildsResponse--;
}

buildUnnamed1633() {
  var o = new core.List<api.Operation>();
  o.add(buildOperation());
  o.add(buildOperation());
  return o;
}

checkUnnamed1633(core.List<api.Operation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperation(o[0]);
  checkOperation(o[1]);
}

core.int buildCounterListOperationsResponse = 0;
buildListOperationsResponse() {
  var o = new api.ListOperationsResponse();
  buildCounterListOperationsResponse++;
  if (buildCounterListOperationsResponse < 3) {
    o.nextPageToken = "foo";
    o.operations = buildUnnamed1633();
  }
  buildCounterListOperationsResponse--;
  return o;
}

checkListOperationsResponse(api.ListOperationsResponse o) {
  buildCounterListOperationsResponse++;
  if (buildCounterListOperationsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed1633(o.operations);
  }
  buildCounterListOperationsResponse--;
}

buildUnnamed1634() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed1634(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted1 = (o["x"]) as core.Map;
  unittest.expect(casted1, unittest.hasLength(3));
  unittest.expect(casted1["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted1["bool"], unittest.equals(true));
  unittest.expect(casted1["string"], unittest.equals('foo'));
  var casted2 = (o["y"]) as core.Map;
  unittest.expect(casted2, unittest.hasLength(3));
  unittest.expect(casted2["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted2["bool"], unittest.equals(true));
  unittest.expect(casted2["string"], unittest.equals('foo'));
}

buildUnnamed1635() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed1635(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted3 = (o["x"]) as core.Map;
  unittest.expect(casted3, unittest.hasLength(3));
  unittest.expect(casted3["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted3["bool"], unittest.equals(true));
  unittest.expect(casted3["string"], unittest.equals('foo'));
  var casted4 = (o["y"]) as core.Map;
  unittest.expect(casted4, unittest.hasLength(3));
  unittest.expect(casted4["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted4["bool"], unittest.equals(true));
  unittest.expect(casted4["string"], unittest.equals('foo'));
}

core.int buildCounterOperation = 0;
buildOperation() {
  var o = new api.Operation();
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    o.done = true;
    o.error = buildStatus();
    o.metadata = buildUnnamed1634();
    o.name = "foo";
    o.response = buildUnnamed1635();
  }
  buildCounterOperation--;
  return o;
}

checkOperation(api.Operation o) {
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    unittest.expect(o.done, unittest.isTrue);
    checkStatus(o.error);
    checkUnnamed1634(o.metadata);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed1635(o.response);
  }
  buildCounterOperation--;
}

core.int buildCounterRepoSource = 0;
buildRepoSource() {
  var o = new api.RepoSource();
  buildCounterRepoSource++;
  if (buildCounterRepoSource < 3) {
    o.branchName = "foo";
    o.commitSha = "foo";
    o.dir = "foo";
    o.projectId = "foo";
    o.repoName = "foo";
    o.tagName = "foo";
  }
  buildCounterRepoSource--;
  return o;
}

checkRepoSource(api.RepoSource o) {
  buildCounterRepoSource++;
  if (buildCounterRepoSource < 3) {
    unittest.expect(o.branchName, unittest.equals('foo'));
    unittest.expect(o.commitSha, unittest.equals('foo'));
    unittest.expect(o.dir, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
    unittest.expect(o.repoName, unittest.equals('foo'));
    unittest.expect(o.tagName, unittest.equals('foo'));
  }
  buildCounterRepoSource--;
}

buildUnnamed1636() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1636(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed1637() {
  var o = new core.List<api.BuiltImage>();
  o.add(buildBuiltImage());
  o.add(buildBuiltImage());
  return o;
}

checkUnnamed1637(core.List<api.BuiltImage> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBuiltImage(o[0]);
  checkBuiltImage(o[1]);
}

core.int buildCounterResults = 0;
buildResults() {
  var o = new api.Results();
  buildCounterResults++;
  if (buildCounterResults < 3) {
    o.artifactManifest = "foo";
    o.buildStepImages = buildUnnamed1636();
    o.images = buildUnnamed1637();
    o.numArtifacts = "foo";
  }
  buildCounterResults--;
  return o;
}

checkResults(api.Results o) {
  buildCounterResults++;
  if (buildCounterResults < 3) {
    unittest.expect(o.artifactManifest, unittest.equals('foo'));
    checkUnnamed1636(o.buildStepImages);
    checkUnnamed1637(o.images);
    unittest.expect(o.numArtifacts, unittest.equals('foo'));
  }
  buildCounterResults--;
}

core.int buildCounterRetryBuildRequest = 0;
buildRetryBuildRequest() {
  var o = new api.RetryBuildRequest();
  buildCounterRetryBuildRequest++;
  if (buildCounterRetryBuildRequest < 3) {}
  buildCounterRetryBuildRequest--;
  return o;
}

checkRetryBuildRequest(api.RetryBuildRequest o) {
  buildCounterRetryBuildRequest++;
  if (buildCounterRetryBuildRequest < 3) {}
  buildCounterRetryBuildRequest--;
}

buildUnnamed1638() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed1638(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterSecret = 0;
buildSecret() {
  var o = new api.Secret();
  buildCounterSecret++;
  if (buildCounterSecret < 3) {
    o.kmsKeyName = "foo";
    o.secretEnv = buildUnnamed1638();
  }
  buildCounterSecret--;
  return o;
}

checkSecret(api.Secret o) {
  buildCounterSecret++;
  if (buildCounterSecret < 3) {
    unittest.expect(o.kmsKeyName, unittest.equals('foo'));
    checkUnnamed1638(o.secretEnv);
  }
  buildCounterSecret--;
}

core.int buildCounterSource = 0;
buildSource() {
  var o = new api.Source();
  buildCounterSource++;
  if (buildCounterSource < 3) {
    o.repoSource = buildRepoSource();
    o.storageSource = buildStorageSource();
  }
  buildCounterSource--;
  return o;
}

checkSource(api.Source o) {
  buildCounterSource++;
  if (buildCounterSource < 3) {
    checkRepoSource(o.repoSource);
    checkStorageSource(o.storageSource);
  }
  buildCounterSource--;
}

buildUnnamed1639() {
  var o = new core.Map<core.String, api.FileHashes>();
  o["x"] = buildFileHashes();
  o["y"] = buildFileHashes();
  return o;
}

checkUnnamed1639(core.Map<core.String, api.FileHashes> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFileHashes(o["x"]);
  checkFileHashes(o["y"]);
}

core.int buildCounterSourceProvenance = 0;
buildSourceProvenance() {
  var o = new api.SourceProvenance();
  buildCounterSourceProvenance++;
  if (buildCounterSourceProvenance < 3) {
    o.fileHashes = buildUnnamed1639();
    o.resolvedRepoSource = buildRepoSource();
    o.resolvedStorageSource = buildStorageSource();
  }
  buildCounterSourceProvenance--;
  return o;
}

checkSourceProvenance(api.SourceProvenance o) {
  buildCounterSourceProvenance++;
  if (buildCounterSourceProvenance < 3) {
    checkUnnamed1639(o.fileHashes);
    checkRepoSource(o.resolvedRepoSource);
    checkStorageSource(o.resolvedStorageSource);
  }
  buildCounterSourceProvenance--;
}

buildUnnamed1640() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed1640(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted5 = (o["x"]) as core.Map;
  unittest.expect(casted5, unittest.hasLength(3));
  unittest.expect(casted5["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted5["bool"], unittest.equals(true));
  unittest.expect(casted5["string"], unittest.equals('foo'));
  var casted6 = (o["y"]) as core.Map;
  unittest.expect(casted6, unittest.hasLength(3));
  unittest.expect(casted6["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted6["bool"], unittest.equals(true));
  unittest.expect(casted6["string"], unittest.equals('foo'));
}

buildUnnamed1641() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed1640());
  o.add(buildUnnamed1640());
  return o;
}

checkUnnamed1641(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed1640(o[0]);
  checkUnnamed1640(o[1]);
}

core.int buildCounterStatus = 0;
buildStatus() {
  var o = new api.Status();
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    o.code = 42;
    o.details = buildUnnamed1641();
    o.message = "foo";
  }
  buildCounterStatus--;
  return o;
}

checkStatus(api.Status o) {
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    unittest.expect(o.code, unittest.equals(42));
    checkUnnamed1641(o.details);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterStatus--;
}

core.int buildCounterStorageSource = 0;
buildStorageSource() {
  var o = new api.StorageSource();
  buildCounterStorageSource++;
  if (buildCounterStorageSource < 3) {
    o.bucket = "foo";
    o.generation = "foo";
    o.object = "foo";
  }
  buildCounterStorageSource--;
  return o;
}

checkStorageSource(api.StorageSource o) {
  buildCounterStorageSource++;
  if (buildCounterStorageSource < 3) {
    unittest.expect(o.bucket, unittest.equals('foo'));
    unittest.expect(o.generation, unittest.equals('foo'));
    unittest.expect(o.object, unittest.equals('foo'));
  }
  buildCounterStorageSource--;
}

core.int buildCounterTimeSpan = 0;
buildTimeSpan() {
  var o = new api.TimeSpan();
  buildCounterTimeSpan++;
  if (buildCounterTimeSpan < 3) {
    o.endTime = "foo";
    o.startTime = "foo";
  }
  buildCounterTimeSpan--;
  return o;
}

checkTimeSpan(api.TimeSpan o) {
  buildCounterTimeSpan++;
  if (buildCounterTimeSpan < 3) {
    unittest.expect(o.endTime, unittest.equals('foo'));
    unittest.expect(o.startTime, unittest.equals('foo'));
  }
  buildCounterTimeSpan--;
}

core.int buildCounterVolume = 0;
buildVolume() {
  var o = new api.Volume();
  buildCounterVolume++;
  if (buildCounterVolume < 3) {
    o.name = "foo";
    o.path = "foo";
  }
  buildCounterVolume--;
  return o;
}

checkVolume(api.Volume o) {
  buildCounterVolume++;
  if (buildCounterVolume < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.path, unittest.equals('foo'));
  }
  buildCounterVolume--;
}

main() {
  unittest.group("obj-schema-ArtifactObjects", () {
    unittest.test("to-json--from-json", () {
      var o = buildArtifactObjects();
      var od = new api.ArtifactObjects.fromJson(o.toJson());
      checkArtifactObjects(od);
    });
  });

  unittest.group("obj-schema-ArtifactResult", () {
    unittest.test("to-json--from-json", () {
      var o = buildArtifactResult();
      var od = new api.ArtifactResult.fromJson(o.toJson());
      checkArtifactResult(od);
    });
  });

  unittest.group("obj-schema-Artifacts", () {
    unittest.test("to-json--from-json", () {
      var o = buildArtifacts();
      var od = new api.Artifacts.fromJson(o.toJson());
      checkArtifacts(od);
    });
  });

  unittest.group("obj-schema-Build", () {
    unittest.test("to-json--from-json", () {
      var o = buildBuild();
      var od = new api.Build.fromJson(o.toJson());
      checkBuild(od);
    });
  });

  unittest.group("obj-schema-BuildOperationMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildBuildOperationMetadata();
      var od = new api.BuildOperationMetadata.fromJson(o.toJson());
      checkBuildOperationMetadata(od);
    });
  });

  unittest.group("obj-schema-BuildOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildBuildOptions();
      var od = new api.BuildOptions.fromJson(o.toJson());
      checkBuildOptions(od);
    });
  });

  unittest.group("obj-schema-BuildStep", () {
    unittest.test("to-json--from-json", () {
      var o = buildBuildStep();
      var od = new api.BuildStep.fromJson(o.toJson());
      checkBuildStep(od);
    });
  });

  unittest.group("obj-schema-BuildTrigger", () {
    unittest.test("to-json--from-json", () {
      var o = buildBuildTrigger();
      var od = new api.BuildTrigger.fromJson(o.toJson());
      checkBuildTrigger(od);
    });
  });

  unittest.group("obj-schema-BuiltImage", () {
    unittest.test("to-json--from-json", () {
      var o = buildBuiltImage();
      var od = new api.BuiltImage.fromJson(o.toJson());
      checkBuiltImage(od);
    });
  });

  unittest.group("obj-schema-CancelBuildRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildCancelBuildRequest();
      var od = new api.CancelBuildRequest.fromJson(o.toJson());
      checkCancelBuildRequest(od);
    });
  });

  unittest.group("obj-schema-CancelOperationRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildCancelOperationRequest();
      var od = new api.CancelOperationRequest.fromJson(o.toJson());
      checkCancelOperationRequest(od);
    });
  });

  unittest.group("obj-schema-Empty", () {
    unittest.test("to-json--from-json", () {
      var o = buildEmpty();
      var od = new api.Empty.fromJson(o.toJson());
      checkEmpty(od);
    });
  });

  unittest.group("obj-schema-FileHashes", () {
    unittest.test("to-json--from-json", () {
      var o = buildFileHashes();
      var od = new api.FileHashes.fromJson(o.toJson());
      checkFileHashes(od);
    });
  });

  unittest.group("obj-schema-Hash", () {
    unittest.test("to-json--from-json", () {
      var o = buildHash();
      var od = new api.Hash.fromJson(o.toJson());
      checkHash(od);
    });
  });

  unittest.group("obj-schema-ListBuildTriggersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListBuildTriggersResponse();
      var od = new api.ListBuildTriggersResponse.fromJson(o.toJson());
      checkListBuildTriggersResponse(od);
    });
  });

  unittest.group("obj-schema-ListBuildsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListBuildsResponse();
      var od = new api.ListBuildsResponse.fromJson(o.toJson());
      checkListBuildsResponse(od);
    });
  });

  unittest.group("obj-schema-ListOperationsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListOperationsResponse();
      var od = new api.ListOperationsResponse.fromJson(o.toJson());
      checkListOperationsResponse(od);
    });
  });

  unittest.group("obj-schema-Operation", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperation();
      var od = new api.Operation.fromJson(o.toJson());
      checkOperation(od);
    });
  });

  unittest.group("obj-schema-RepoSource", () {
    unittest.test("to-json--from-json", () {
      var o = buildRepoSource();
      var od = new api.RepoSource.fromJson(o.toJson());
      checkRepoSource(od);
    });
  });

  unittest.group("obj-schema-Results", () {
    unittest.test("to-json--from-json", () {
      var o = buildResults();
      var od = new api.Results.fromJson(o.toJson());
      checkResults(od);
    });
  });

  unittest.group("obj-schema-RetryBuildRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildRetryBuildRequest();
      var od = new api.RetryBuildRequest.fromJson(o.toJson());
      checkRetryBuildRequest(od);
    });
  });

  unittest.group("obj-schema-Secret", () {
    unittest.test("to-json--from-json", () {
      var o = buildSecret();
      var od = new api.Secret.fromJson(o.toJson());
      checkSecret(od);
    });
  });

  unittest.group("obj-schema-Source", () {
    unittest.test("to-json--from-json", () {
      var o = buildSource();
      var od = new api.Source.fromJson(o.toJson());
      checkSource(od);
    });
  });

  unittest.group("obj-schema-SourceProvenance", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceProvenance();
      var od = new api.SourceProvenance.fromJson(o.toJson());
      checkSourceProvenance(od);
    });
  });

  unittest.group("obj-schema-Status", () {
    unittest.test("to-json--from-json", () {
      var o = buildStatus();
      var od = new api.Status.fromJson(o.toJson());
      checkStatus(od);
    });
  });

  unittest.group("obj-schema-StorageSource", () {
    unittest.test("to-json--from-json", () {
      var o = buildStorageSource();
      var od = new api.StorageSource.fromJson(o.toJson());
      checkStorageSource(od);
    });
  });

  unittest.group("obj-schema-TimeSpan", () {
    unittest.test("to-json--from-json", () {
      var o = buildTimeSpan();
      var od = new api.TimeSpan.fromJson(o.toJson());
      checkTimeSpan(od);
    });
  });

  unittest.group("obj-schema-Volume", () {
    unittest.test("to-json--from-json", () {
      var o = buildVolume();
      var od = new api.Volume.fromJson(o.toJson());
      checkVolume(od);
    });
  });

  unittest.group("resource-OperationsResourceApi", () {
    unittest.test("method--cancel", () {
      var mock = new HttpServerMock();
      api.OperationsResourceApi res = new api.CloudbuildApi(mock).operations;
      var arg_request = buildCancelOperationRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CancelOperationRequest.fromJson(json);
        checkCancelOperationRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .cancel(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.OperationsResourceApi res = new api.CloudbuildApi(mock).operations;
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.OperationsResourceApi res = new api.CloudbuildApi(mock).operations;
      var arg_name = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_filter = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListOperationsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_name,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              filter: arg_filter,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListOperationsResponse(response);
      })));
    });
  });

  unittest.group("resource-ProjectsBuildsResourceApi", () {
    unittest.test("method--cancel", () {
      var mock = new HttpServerMock();
      api.ProjectsBuildsResourceApi res =
          new api.CloudbuildApi(mock).projects.builds;
      var arg_request = buildCancelBuildRequest();
      var arg_projectId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CancelBuildRequest.fromJson(json);
        checkCancelBuildRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/builds/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/builds/"));
        pathOffset += 8;
        index = path.indexOf(":cancel", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_id"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals(":cancel"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildBuild());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .cancel(arg_request, arg_projectId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkBuild(response);
      })));
    });

    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.ProjectsBuildsResourceApi res =
          new api.CloudbuildApi(mock).projects.builds;
      var arg_request = buildBuild();
      var arg_projectId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Build.fromJson(json);
        checkBuild(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/builds", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/builds"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_projectId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ProjectsBuildsResourceApi res =
          new api.CloudbuildApi(mock).projects.builds;
      var arg_projectId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/builds/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/builds/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildBuild());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_projectId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkBuild(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ProjectsBuildsResourceApi res =
          new api.CloudbuildApi(mock).projects.builds;
      var arg_projectId = "foo";
      var arg_filter = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/builds", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/builds"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListBuildsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_projectId,
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListBuildsResponse(response);
      })));
    });

    unittest.test("method--retry", () {
      var mock = new HttpServerMock();
      api.ProjectsBuildsResourceApi res =
          new api.CloudbuildApi(mock).projects.builds;
      var arg_request = buildRetryBuildRequest();
      var arg_projectId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.RetryBuildRequest.fromJson(json);
        checkRetryBuildRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/builds/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/builds/"));
        pathOffset += 8;
        index = path.indexOf(":retry", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_id"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals(":retry"));
        pathOffset += 6;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .retry(arg_request, arg_projectId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });
  });

  unittest.group("resource-ProjectsTriggersResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.ProjectsTriggersResourceApi res =
          new api.CloudbuildApi(mock).projects.triggers;
      var arg_request = buildBuildTrigger();
      var arg_projectId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.BuildTrigger.fromJson(json);
        checkBuildTrigger(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/triggers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/triggers"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildBuildTrigger());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_projectId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkBuildTrigger(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.ProjectsTriggersResourceApi res =
          new api.CloudbuildApi(mock).projects.triggers;
      var arg_projectId = "foo";
      var arg_triggerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/triggers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/triggers/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_triggerId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_projectId, arg_triggerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ProjectsTriggersResourceApi res =
          new api.CloudbuildApi(mock).projects.triggers;
      var arg_projectId = "foo";
      var arg_triggerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/triggers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/triggers/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_triggerId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildBuildTrigger());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_projectId, arg_triggerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkBuildTrigger(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ProjectsTriggersResourceApi res =
          new api.CloudbuildApi(mock).projects.triggers;
      var arg_projectId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/triggers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/triggers"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListBuildTriggersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_projectId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListBuildTriggersResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.ProjectsTriggersResourceApi res =
          new api.CloudbuildApi(mock).projects.triggers;
      var arg_request = buildBuildTrigger();
      var arg_projectId = "foo";
      var arg_triggerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.BuildTrigger.fromJson(json);
        checkBuildTrigger(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/triggers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/triggers/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_triggerId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildBuildTrigger());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_projectId, arg_triggerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkBuildTrigger(response);
      })));
    });

    unittest.test("method--run", () {
      var mock = new HttpServerMock();
      api.ProjectsTriggersResourceApi res =
          new api.CloudbuildApi(mock).projects.triggers;
      var arg_request = buildRepoSource();
      var arg_projectId = "foo";
      var arg_triggerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.RepoSource.fromJson(json);
        checkRepoSource(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/projects/"));
        pathOffset += 12;
        index = path.indexOf("/triggers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/triggers/"));
        pathOffset += 10;
        index = path.indexOf(":run", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_triggerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 4),
            unittest.equals(":run"));
        pathOffset += 4;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .run(arg_request, arg_projectId, arg_triggerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });
  });
}
