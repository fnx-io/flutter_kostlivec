import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_kostlivec/src/app_mode.dart';
import 'package:flutter_kostlivec/src/service/app_config_service.dart';
import 'package:flutter_kostlivec/src/state/app_config_state.dart';
import 'package:flutter_kostlivec/src/state/persistent_state.dart';
import 'package:flutter_kostlivec/src/state/serializers.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';
import 'package:path_provider/path_provider.dart';

///
/// Servis, ktery uklada na disk data, ktera by mela prezit restart aplikace. Tim se ani tak nemysli data databazova, ty si dejte do SqlLite,
/// ale takova ta mensi nastavenicka, rozpracovane formulare apod.
///
/// Aby se vam pekne ukladala, musite upravit metody:
/// _buildPersistentState a _restorePersistenState.
///
/// Stav se automaticky uklada pri zapauzovani aplikace a nacita se pri startu.
///
class PersistenceService {
  StateHolder<AppConfigState> get appConfig => getMyStateHolder<AppConfigState>();

  ///
  /// Uloz aktualni stav aplikace (viz _buildPersistentState)
  ///
  Future saveAppState() async {
    PersistentState s = _buildPersistentState();
    await _savePersistentState(s);
  }

  ///
  /// Načti uložený stav aplikace (viz _restorePersistentState)
  ///
  Future loadPreviousState() async {
    File state = await _getStateJsonFile();
    if (await state.exists()) {
      String json = await state.readAsString();
      PersistentState p = serializers.deserialize(jsonDecode(json));
      _restorePersistentState(p);
    }
  }

  ///
  /// Davaj adresář na data aplikace.
  ///
  Future<Directory> getAppDataDirectory() async {
    Directory baseDirectory = await getApplicationDocumentsDirectory();
    String suffix = appConfig.state.mode == AppMode.PROD ? "prod" : "dev";
    Directory result = Directory(baseDirectory.path + "/" + suffix + "/");
    await result.create(recursive: true);
    return result;
  }

  PersistentState _buildPersistentState() {
    Locale l = appConfig.state.locale;
    PersistentState p = PersistentState((b) => b
      ..language = l.languageCode
      ..counter = appConfig.state.counter);
    return p;
  }

  void _restorePersistentState(PersistentState p) {
    appConfig.state = appConfig.state.rebuild((b) => b..counter = p.counter ?? 0);
    // Tohle ma nejake konsekvence, napriklad se zmeni Messages, takze to nastavime pres servis:
    getMy<AppConfigService>().setLocale(p.language);
  }

  Future _savePersistentState(PersistentState s) async {
    Object serialized = serializers.serialize(s);
    String json = jsonEncode(serialized);

    File state = await _getStateJsonFile();
    await state.writeAsString(json);
  }

  Future<File> _getStateJsonFile() async {
    Directory base = await getAppDataDirectory();
    return File(base.path + "/persistent_state.json");
  }
}
