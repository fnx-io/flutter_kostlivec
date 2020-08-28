import 'package:built_value/built_value.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;

class StateHolder<STATE extends Built<dynamic, dynamic>> with ChangeNotifier {
  STATE _state;

  StateHolder(this._state);

  STATE get state => _state;

  set state(STATE value) {
    _state = value;
    notifyListeners();
  }
}
