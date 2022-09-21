// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency__entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) {
  return CurrencyModel(
    name: json['name'] as String?,
    count: (json['count'] as num?)?.toDouble(),
    color: json['color'] as String?,
  );
}

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'color': instance.color,
    };
