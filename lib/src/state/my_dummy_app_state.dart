import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'my_dummy_app_state.g.dart';

///
/// Dummy ukazka business logiky.
///
abstract class MyDummyAppState implements Built<MyDummyAppState, MyDummyAppStateBuilder> {
  static Serializer<MyDummyAppState> get serializer => _$myDummyAppStateSerializer;

  // Can never be null.
  int? get counter;

  MyDummyAppState._();
  factory MyDummyAppState([void Function(MyDummyAppStateBuilder) updates]) = _$MyDummyAppState;
}
