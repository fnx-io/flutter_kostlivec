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
  Iterable<Object> serialize(Serializers serializers, ItemState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'index',
      serializers.serialize(object.index, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ItemState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ItemStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ItemState extends ItemState {
  @override
  final int index;
  @override
  final String name;

  factory _$ItemState([void Function(ItemStateBuilder) updates]) =>
      (new ItemStateBuilder()..update(updates)).build();

  _$ItemState._({this.index, this.name}) : super._() {
    if (index == null) {
      throw new BuiltValueNullFieldError('ItemState', 'index');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('ItemState', 'name');
    }
  }

  @override
  ItemState rebuild(void Function(ItemStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemStateBuilder toBuilder() => new ItemStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemState && index == other.index && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, index.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ItemState')
          ..add('index', index)
          ..add('name', name))
        .toString();
  }
}

class ItemStateBuilder implements Builder<ItemState, ItemStateBuilder> {
  _$ItemState _$v;

  int _index;
  int get index => _$this._index;
  set index(int index) => _$this._index = index;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ItemStateBuilder();

  ItemStateBuilder get _$this {
    if (_$v != null) {
      _index = _$v.index;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ItemState;
  }

  @override
  void update(void Function(ItemStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ItemState build() {
    final _$result = _$v ?? new _$ItemState._(index: index, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
