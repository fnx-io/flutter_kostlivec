import 'package:flutter/widgets.dart' show ChangeNotifier;

///
/// Různé instance této třídy si drží odkaz na odpovídající stavový objekt.
///
class StateHolder<STATE> with ChangeNotifier {
  STATE _state;

  StateHolder(this._state);

  STATE get state => _state;

  set state(STATE value) {
    _state = value;
    notifyListeners();
  }
}
