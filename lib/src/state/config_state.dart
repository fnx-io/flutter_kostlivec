import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:flutter_kostlivec/src/build_flavor.dart';

part 'config_state.g.dart';

///
/// Nastaveni aplikace, aktualni locale, mozna i dalsi preference.
///
abstract class ConfigState implements Built<ConfigState, ConfigStateBuilder> {
  static Serializer<ConfigState> get serializer => _$configStateSerializer;

  BuildFlavor get mode;

  Locale get locale;

  ConfigState._();
  factory ConfigState([void Function(ConfigStateBuilder) updates]) = _$ConfigState;
}
