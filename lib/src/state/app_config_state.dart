import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_kostlivec/src/app_mode.dart';

part 'app_config_state.g.dart';

abstract class AppConfigState implements Built<AppConfigState, AppConfigStateBuilder> {
  static Serializer<AppConfigState> get serializer => _$appConfigStateSerializer;

  // Can never be null.
  int get counter;

  AppMode get mode;

//  @nullable
//  int get age;
//
//  @nullable
//  @BuiltValueField(wireName: 'first_name')
//  String get firstName;
//
//  @nullable
//  BuiltList<String> get hobbies;

  AppConfigState._();
  factory AppConfigState([void Function(AppConfigStateBuilder) updates]) = _$AppConfigState;
}
