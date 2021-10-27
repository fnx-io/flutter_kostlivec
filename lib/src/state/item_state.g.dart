// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ItemState> _$itemStateSerializer = new _$ItemStateSerializer();

class _$ItemStateSerializer implements StructuredSerializer<ItemState> {
  @override
  final Iterable<Type> types = const [ItemState, _$ItemState];
  @override
  final String wireName = 'ItemState';

  @override
  Iterable<Object?> serialize(Serializers serializers, ItemState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.index;
    if (value != null) {
      result
        ..add('index')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.info;
    if (value != null) {
      result
        ..add('info')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ItemState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ItemStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ItemState extends ItemState {
  @override
  final int? index;
  @override
  final String? name;
  @override
  final String? info;

  factory _$ItemState([void Function(ItemStateBuilder)? updates]) =>
      (new ItemStateBuilder()..update(updates)).build();

  _$ItemState._({this.index, this.name, this.info}) : super._();

  @override
  ItemState rebuild(void Function(ItemStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemStateBuilder toBuilder() => new ItemStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemState &&
        index == other.index &&
        name == other.name &&
        info == other.info;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, index.hashCode), name.hashCode), info.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ItemState')
          ..add('index', index)
          ..add('name', name)
          ..add('info', info))
        .toString();
  }
}

class ItemStateBuilder implements Builder<ItemState, ItemStateBuilder> {
  _$ItemState? _$v;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _info;
  String? get info => _$this._info;
  set info(String? info) => _$this._info = info;

  ItemStateBuilder();

  ItemStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _index = $v.index;
      _name = $v.name;
      _info = $v.info;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemState;
  }

  @override
  void update(void Function(ItemStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ItemState build() {
    final _$result =
        _$v ?? new _$ItemState._(index: index, name: name, info: info);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
