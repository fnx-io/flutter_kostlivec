// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_dummy_app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyDummyAppState _$MyDummyAppStateFromJson(Map<String, dynamic> json) {
  return _MyDummyAppState.fromJson(json);
}

/// @nodoc
mixin _$MyDummyAppState {
  int get counter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyDummyAppStateCopyWith<MyDummyAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyDummyAppStateCopyWith<$Res> {
  factory $MyDummyAppStateCopyWith(
          MyDummyAppState value, $Res Function(MyDummyAppState) then) =
      _$MyDummyAppStateCopyWithImpl<$Res, MyDummyAppState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$MyDummyAppStateCopyWithImpl<$Res, $Val extends MyDummyAppState>
    implements $MyDummyAppStateCopyWith<$Res> {
  _$MyDummyAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyDummyAppStateImplCopyWith<$Res>
    implements $MyDummyAppStateCopyWith<$Res> {
  factory _$$MyDummyAppStateImplCopyWith(_$MyDummyAppStateImpl value,
          $Res Function(_$MyDummyAppStateImpl) then) =
      __$$MyDummyAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$MyDummyAppStateImplCopyWithImpl<$Res>
    extends _$MyDummyAppStateCopyWithImpl<$Res, _$MyDummyAppStateImpl>
    implements _$$MyDummyAppStateImplCopyWith<$Res> {
  __$$MyDummyAppStateImplCopyWithImpl(
      _$MyDummyAppStateImpl _value, $Res Function(_$MyDummyAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$MyDummyAppStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyDummyAppStateImpl
    with DiagnosticableTreeMixin
    implements _MyDummyAppState {
  const _$MyDummyAppStateImpl({required this.counter});

  factory _$MyDummyAppStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyDummyAppStateImplFromJson(json);

  @override
  final int counter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyDummyAppState(counter: $counter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyDummyAppState'))
      ..add(DiagnosticsProperty('counter', counter));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyDummyAppStateImpl &&
            (identical(other.counter, counter) || other.counter == counter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, counter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyDummyAppStateImplCopyWith<_$MyDummyAppStateImpl> get copyWith =>
      __$$MyDummyAppStateImplCopyWithImpl<_$MyDummyAppStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyDummyAppStateImplToJson(
      this,
    );
  }
}

abstract class _MyDummyAppState implements MyDummyAppState {
  const factory _MyDummyAppState({required final int counter}) =
      _$MyDummyAppStateImpl;

  factory _MyDummyAppState.fromJson(Map<String, dynamic> json) =
      _$MyDummyAppStateImpl.fromJson;

  @override
  int get counter;
  @override
  @JsonKey(ignore: true)
  _$$MyDummyAppStateImplCopyWith<_$MyDummyAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
