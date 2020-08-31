import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_kostlivec/src/app_mode.dart';
import 'package:flutter_kostlivec/src/state/app_config_state.dart';
import 'package:flutter_kostlivec/src/state/persistent_state.dart';
import 'package:flutter_kostlivec/src/state/serializers.dart';
import 'package:flutter_kostlivec/src/util.dart';
import 'package:path_provider/path_provider.dart';

class PersistenceService {
  AppConfigState get appConfig => getMyState<AppConfigState>().state;

  Future saveAppState() async {
    PersistentState s = _buildPersistentState();
    await _savePersistentState(s);
  }

  PersistentState _buildPersistentState() {
    Locale l = appConfig.locale;
    PersistentState p = PersistentState((b) => b
      ..language = l.languageCode
      ..counter = appConfig.counter);
    return p;
  }

  Future _savePersistentState(PersistentState s) async {
    Object serialized = serializers.serialize(s);
    String json = jsonEncode(serialized);
    log.info("Serialized persistent state: $json");

    Directory base = await getAppDataDirectory();
    File state = File(base.path + "/persistent_state.json");
    await state.writeAsString(json);
  }

  Future<Directory> getAppDataDirectory() async {
    Directory baseDirectory = await getApplicationDocumentsDirectory();
    String suffix = appConfig.mode == AppMode.PROD ? "prod" : "dev";
    Directory result = Directory(baseDirectory.path + "/" + suffix + "/");
    await result.create(recursive: true);
    return result;
  }
}
