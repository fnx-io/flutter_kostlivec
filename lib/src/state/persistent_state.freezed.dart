// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persistent_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersistentState _$PersistentStateFromJson(Map<String, dynamic> json) {
  return _PersistentState.fromJson(json);
}

/// @nodoc
mixin _$PersistentState {
  String? get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersistentStateCopyWith<PersistentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersistentStateCopyWith<$Res> {
  factory $PersistentStateCopyWith(
          PersistentState value, $Res Function(PersistentState) then) =
      _$PersistentStateCopyWithImpl<$Res, PersistentState>;
  @useResult
  $Res call({String? language});
}

/// @nodoc
class _$PersistentStateCopyWithImpl<$Res, $Val extends PersistentState>
    implements $PersistentStateCopyWith<$Res> {
  _$PersistentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersistentStateImplCopyWith<$Res>
    implements $PersistentStateCopyWith<$Res> {
  factory _$$PersistentStateImplCopyWith(_$PersistentStateImpl value,
          $Res Function(_$PersistentStateImpl) then) =
      __$$PersistentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? language});
}

/// @nodoc
class __$$PersistentStateImplCopyWithImpl<$Res>
    extends _$PersistentStateCopyWithImpl<$Res, _$PersistentStateImpl>
    implements _$$PersistentStateImplCopyWith<$Res> {
  __$$PersistentStateImplCopyWithImpl(
      _$PersistentStateImpl _value, $Res Function(_$PersistentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
  }) {
    return _then(_$PersistentStateImpl(
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersistentStateImpl
    with DiagnosticableTreeMixin
    implements _PersistentState {
  const _$PersistentStateImpl({this.language});

  factory _$PersistentStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersistentStateImplFromJson(json);

  @override
  final String? language;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersistentState(language: $language)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersistentState'))
      ..add(DiagnosticsProperty('language', language));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersistentStateImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersistentStateImplCopyWith<_$PersistentStateImpl> get copyWith =>
      __$$PersistentStateImplCopyWithImpl<_$PersistentStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersistentStateImplToJson(
      this,
    );
  }
}

abstract class _PersistentState implements PersistentState {
  const factory _PersistentState({final String? language}) =
      _$PersistentStateImpl;

  factory _PersistentState.fromJson(Map<String, dynamic> json) =
      _$PersistentStateImpl.fromJson;

  @override
  String? get language;
  @override
  @JsonKey(ignore: true)
  _$$PersistentStateImplCopyWith<_$PersistentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
