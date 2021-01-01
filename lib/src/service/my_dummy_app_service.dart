import 'package:flutter_kostlivec/src/build_flavor.dart';
import 'package:flutter_kostlivec/src/state/my_dummy_app_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';

///
/// Metody pro manipulaci s MyDummyAppState. Až přidáš další stav, asi budeš chtít
/// přidat i další service.
///
/// Servisní metody by asi většinou neměly vracet data, data by se měla objevit ve stavovém objektu.
///
///
class MyDummyAppService {
  StateHolder<MyDummyAppState> get holder => getMy<StateHolder<MyDummyAppState>>();

  MyDummyAppState prepareDefaultState(BuildFlavor mode) {
    return MyDummyAppState((MyDummyAppStateBuilder b) => b..counter = 1);
  }

  ///
  /// Demo metoda - zvedni pocitadlo.
  ///
  void incrementCounter() {
    holder.state = holder.state.rebuild((MyDummyAppStateBuilder b) {
      b.counter = b.counter + 1;
    });
  }
}
