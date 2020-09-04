import 'package:flutter/cupertino.dart';
import 'package:flutter_kostlivec/src/app_mode.dart';
import 'package:flutter_kostlivec/src/i69n/locales.dart' as locales;
import 'package:flutter_kostlivec/src/i69n/messages.i69n.dart';
import 'package:flutter_kostlivec/src/state/app_config_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';

///
/// Metody pro manipulaci s AppConfigState. Až přidáš další stav, asi budeš chtít
/// přidat i další service.
///
/// Servisní metody by asi většinou neměly vracet data, data by se měla objevit ve stavovém objektu.
///
///
class AppConfigService {
  StateHolder<AppConfigState> get holder => getMy<StateHolder<AppConfigState>>();

  AppConfigState prepareDefaultState(AppMode mode) {
    return AppConfigState((AppConfigStateBuilder b) => b
      ..locale = locales.detectLocale()
      ..counter = 1
      ..mode = mode);
  }

  ///
  /// Demo metoda - zvedni pocitadlo.
  ///
  void incrementCounter() {
    holder.state = holder.state.rebuild((AppConfigStateBuilder b) {
      b.counter = b.counter + 1;
    });
  }

  ///
  /// Nastav jazyk / locale.
  ///
  void setLocale(String lang) {
    Locale locale = locales.findNearestLocale(Locale(lang));
    holder.state = holder.state.rebuild((AppConfigStateBuilder b) {
      b.locale = locale;
    });
    log.info("Messages changed to $locale");
    getMy<StateHolder<Messages>>().state = locales.getMessagesByLocale(locale);
  }
}
