import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'persistent_state.g.dart';

abstract class PersistentState implements Built<PersistentState, PersistentStateBuilder> {
  static Serializer<PersistentState> get serializer => _$persistentStateSerializer;

  String get language;

  int get counter;

  PersistentState._();
  factory PersistentState([void Function(PersistentStateBuilder) updates]) = _$PersistentState;
}
