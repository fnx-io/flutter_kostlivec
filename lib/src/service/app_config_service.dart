import 'package:flutter_kostlivec/src/app_mode.dart';
import 'package:flutter_kostlivec/src/i69n/locales.dart';
import 'package:flutter_kostlivec/src/state/app_config_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';

class AppConfigService {
  StateHolder<AppConfigState> get holder => getMy<StateHolder<AppConfigState>>();

  AppConfigState buildInitialState(AppMode mode) {
    return AppConfigState((AppConfigStateBuilder b) => b
      ..locale = detectLocale()
      ..counter = 1
      ..mode = mode);
  }

  void incrementCounter() {
    holder.state = holder.state.rebuild((AppConfigStateBuilder b) {
      b.counter = b.counter + 1;
    });
  }
}
