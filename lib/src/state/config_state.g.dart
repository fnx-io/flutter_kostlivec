// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConfigState> _$configStateSerializer = new _$ConfigStateSerializer();

class _$ConfigStateSerializer implements StructuredSerializer<ConfigState> {
  @override
  final Iterable<Type> types = const [ConfigState, _$ConfigState];
  @override
  final String wireName = 'ConfigState';

  @override
  Iterable<Object> serialize(Serializers serializers, ConfigState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'mode',
      serializers.serialize(object.mode, specifiedType: const FullType(BuildFlavor)),
      'locale',
      serializers.serialize(object.locale, specifiedType: const FullType(Locale)),
    ];

    return result;
  }

  @override
  ConfigState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConfigStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'mode':
          result.mode = serializers.deserialize(value, specifiedType: const FullType(BuildFlavor)) as BuildFlavor;
          break;
        case 'locale':
          result.locale = serializers.deserialize(value, specifiedType: const FullType(Locale)) as Locale;
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigState extends ConfigState {
  @override
  final BuildFlavor mode;
  @override
  final Locale locale;

  factory _$ConfigState([void Function(ConfigStateBuilder) updates]) =>
      (new ConfigStateBuilder()..update(updates)).build();

  _$ConfigState._({this.mode, this.locale}) : super._() {
    if (mode == null) {
      throw new BuiltValueNullFieldError('ConfigState', 'mode');
    }
    if (locale == null) {
      throw new BuiltValueNullFieldError('ConfigState', 'locale');
    }
  }

  @override
  ConfigState rebuild(void Function(ConfigStateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ConfigStateBuilder toBuilder() => new ConfigStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigState && mode == other.mode && locale == other.locale;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, mode.hashCode), locale.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfigState')..add('mode', mode)..add('locale', locale)).toString();
  }
}

class ConfigStateBuilder implements Builder<ConfigState, ConfigStateBuilder> {
  _$ConfigState _$v;

  BuildFlavor _mode;
  BuildFlavor get mode => _$this._mode;
  set mode(BuildFlavor mode) => _$this._mode = mode;

  Locale _locale;
  Locale get locale => _$this._locale;
  set locale(Locale locale) => _$this._locale = locale;

  ConfigStateBuilder();

  ConfigStateBuilder get _$this {
    if (_$v != null) {
      _mode = _$v.mode;
      _locale = _$v.locale;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConfigState;
  }

  @override
  void update(void Function(ConfigStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigState build() {
    final _$result = _$v ?? new _$ConfigState._(mode: mode, locale: locale);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
