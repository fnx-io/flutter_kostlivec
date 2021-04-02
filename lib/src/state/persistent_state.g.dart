// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistent_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PersistentState> _$persistentStateSerializer = new _$PersistentStateSerializer();

class _$PersistentStateSerializer implements StructuredSerializer<PersistentState> {
  @override
  final Iterable<Type> types = const [PersistentState, _$PersistentState];
  @override
  final String wireName = 'PersistentState';

  @override
  Iterable<Object> serialize(Serializers serializers, PersistentState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'language',
      serializers.serialize(object.language, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PersistentState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PersistentStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'language':
          result.language = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PersistentState extends PersistentState {
  @override
  final String language;

  factory _$PersistentState([void Function(PersistentStateBuilder) updates]) =>
      (new PersistentStateBuilder()..update(updates)).build();

  _$PersistentState._({this.language}) : super._() {
    if (language == null) {
      throw new BuiltValueNullFieldError('PersistentState', 'language');
    }
  }

  @override
  PersistentState rebuild(void Function(PersistentStateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  PersistentStateBuilder toBuilder() => new PersistentStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersistentState && language == other.language;
  }

  @override
  int get hashCode {
    return $jf($jc(0, language.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PersistentState')..add('language', language)).toString();
  }
}

class PersistentStateBuilder implements Builder<PersistentState, PersistentStateBuilder> {
  _$PersistentState _$v;

  String _language;
  String get language => _$this._language;
  set language(String language) => _$this._language = language;

  PersistentStateBuilder();

  PersistentStateBuilder get _$this {
    if (_$v != null) {
      _language = _$v.language;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersistentState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PersistentState;
  }

  @override
  void update(void Function(PersistentStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PersistentState build() {
    final _$result = _$v ?? new _$PersistentState._(language: language);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
