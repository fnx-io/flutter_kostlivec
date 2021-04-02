import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter_kostlivec/src/util.dart';
import 'package:provider/provider.dart';

///
/// Různé instance této třídy si drží odkaz na odpovídající stavový objekt.
///
class StateHolder<STATE> with ChangeNotifier {
  STATE _state;

  int _version = 1;

  // changes with evry state change, use it as a ValueKey, arbitrary cache key etc. change in version implies change in state.
  int get version => _version;

  StateHolder(this._state);

  STATE get state => _state;

  set state(STATE value) {
    _version++;
    _state = value;
    log.info("State change, version=${_version}");
    notifyListeners();
  }

  /// Wraps argument widget in ChangeNotifierProvider providing this state holder.
  /// Usefull for temporary (i.e. one screen) states.
  ///
  Widget provideFor(Widget subTree) {
    return ChangeNotifierProvider.value(value: this, child: subTree);
  }
}
