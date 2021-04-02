// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_dummy_app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MyDummyAppState> _$myDummyAppStateSerializer = new _$MyDummyAppStateSerializer();

class _$MyDummyAppStateSerializer implements StructuredSerializer<MyDummyAppState> {
  @override
  final Iterable<Type> types = const [MyDummyAppState, _$MyDummyAppState];
  @override
  final String wireName = 'MyDummyAppState';

  @override
  Iterable<Object> serialize(Serializers serializers, MyDummyAppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'counter',
      serializers.serialize(object.counter, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  MyDummyAppState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MyDummyAppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'counter':
          result.counter = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MyDummyAppState extends MyDummyAppState {
  @override
  final int counter;

  factory _$MyDummyAppState([void Function(MyDummyAppStateBuilder) updates]) =>
      (new MyDummyAppStateBuilder()..update(updates)).build();

  _$MyDummyAppState._({this.counter}) : super._() {
    if (counter == null) {
      throw new BuiltValueNullFieldError('MyDummyAppState', 'counter');
    }
  }

  @override
  MyDummyAppState rebuild(void Function(MyDummyAppStateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  MyDummyAppStateBuilder toBuilder() => new MyDummyAppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyDummyAppState && counter == other.counter;
  }

  @override
  int get hashCode {
    return $jf($jc(0, counter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MyDummyAppState')..add('counter', counter)).toString();
  }
}

class MyDummyAppStateBuilder implements Builder<MyDummyAppState, MyDummyAppStateBuilder> {
  _$MyDummyAppState _$v;

  int _counter;
  int get counter => _$this._counter;
  set counter(int counter) => _$this._counter = counter;

  MyDummyAppStateBuilder();

  MyDummyAppStateBuilder get _$this {
    if (_$v != null) {
      _counter = _$v.counter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyDummyAppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MyDummyAppState;
  }

  @override
  void update(void Function(MyDummyAppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MyDummyAppState build() {
    final _$result = _$v ?? new _$MyDummyAppState._(counter: counter);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
