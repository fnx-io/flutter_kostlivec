import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter_kostlivec/src/util.dart';

///
/// Různé instance této třídy si drží odkaz na odpovídající stavový objekt.
///
class StateHolder<STATE> with ChangeNotifier {
  STATE _state;

  StateHolder(this._state);

  STATE get state => _state;

  set state(STATE value) {
    _state = value;
    log.fine("State changed");
    notifyListeners();
  }
}
