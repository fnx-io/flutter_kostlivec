// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppConfigState> _$appConfigStateSerializer =
    new _$AppConfigStateSerializer();

class _$AppConfigStateSerializer
    implements StructuredSerializer<AppConfigState> {
  @override
  final Iterable<Type> types = const [AppConfigState, _$AppConfigState];
  @override
  final String wireName = 'AppConfigState';

  @override
  Iterable<Object> serialize(Serializers serializers, AppConfigState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'counter',
      serializers.serialize(object.counter, specifiedType: const FullType(int)),
      'mode',
      serializers.serialize(object.mode,
          specifiedType: const FullType(AppMode)),
      'locale',
      serializers.serialize(object.locale,
          specifiedType: const FullType(Locale)),
    ];

    return result;
  }

  @override
  AppConfigState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppConfigStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'counter':
          result.counter = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'mode':
          result.mode = serializers.deserialize(value,
              specifiedType: const FullType(AppMode)) as AppMode;
          break;
        case 'locale':
          result.locale = serializers.deserialize(value,
              specifiedType: const FullType(Locale)) as Locale;
          break;
      }
    }

    return result.build();
  }
}

class _$AppConfigState extends AppConfigState {
  @override
  final int counter;
  @override
  final AppMode mode;
  @override
  final Locale locale;

  factory _$AppConfigState([void Function(AppConfigStateBuilder) updates]) =>
      (new AppConfigStateBuilder()..update(updates)).build();

  _$AppConfigState._({this.counter, this.mode, this.locale}) : super._() {
    if (counter == null) {
      throw new BuiltValueNullFieldError('AppConfigState', 'counter');
    }
    if (mode == null) {
      throw new BuiltValueNullFieldError('AppConfigState', 'mode');
    }
    if (locale == null) {
      throw new BuiltValueNullFieldError('AppConfigState', 'locale');
    }
  }

  @override
  AppConfigState rebuild(void Function(AppConfigStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppConfigStateBuilder toBuilder() =>
      new AppConfigStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppConfigState &&
        counter == other.counter &&
        mode == other.mode &&
        locale == other.locale;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, counter.hashCode), mode.hashCode), locale.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppConfigState')
          ..add('counter', counter)
          ..add('mode', mode)
          ..add('locale', locale))
        .toString();
  }
}

class AppConfigStateBuilder
    implements Builder<AppConfigState, AppConfigStateBuilder> {
  _$AppConfigState _$v;

  int _counter;
  int get counter => _$this._counter;
  set counter(int counter) => _$this._counter = counter;

  AppMode _mode;
  AppMode get mode => _$this._mode;
  set mode(AppMode mode) => _$this._mode = mode;

  Locale _locale;
  Locale get locale => _$this._locale;
  set locale(Locale locale) => _$this._locale = locale;

  AppConfigStateBuilder();

  AppConfigStateBuilder get _$this {
    if (_$v != null) {
      _counter = _$v.counter;
      _mode = _$v.mode;
      _locale = _$v.locale;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppConfigState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppConfigState;
  }

  @override
  void update(void Function(AppConfigStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppConfigState build() {
    final _$result = _$v ??
        new _$AppConfigState._(counter: counter, mode: mode, locale: locale);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
