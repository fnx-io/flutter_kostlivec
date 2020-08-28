import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  // Can never be null.
  int get counter;

//  @nullable
//  int get age;
//
//  @nullable
//  @BuiltValueField(wireName: 'first_name')
//  String get firstName;
//
//  @nullable
//  BuiltList<String> get hobbies;

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
}
