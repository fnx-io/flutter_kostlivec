// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigStateImpl _$$ConfigStateImplFromJson(Map<String, dynamic> json) =>
    _$ConfigStateImpl(
      mode: $enumDecode(_$BuildFlavorEnumMap, json['mode']),
      locale: fromJsonLocale(json['locale'] as Map<String, String?>),
    );

Map<String, dynamic> _$$ConfigStateImplToJson(_$ConfigStateImpl instance) =>
    <String, dynamic>{
      'mode': _$BuildFlavorEnumMap[instance.mode]!,
      'locale': toJsonLocale(instance.locale),
    };

const _$BuildFlavorEnumMap = {
  BuildFlavor.PROD: 'PROD',
  BuildFlavor.TEST: 'TEST',
};
