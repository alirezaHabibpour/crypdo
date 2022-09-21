// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDto _$ContactDtoFromJson(Map<String, dynamic> json) {
  return ContactDto(
    name: json['name'] as String?,
    family: json['family'] as String?,
    mobileNumber: json['mobileNumber'] as int?,
    address: json['address'] as int?,
  );
}

Map<String, dynamic> _$ContactDtoToJson(ContactDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'family': instance.family,
      'mobileNumber': instance.mobileNumber,
      'address': instance.address,
    };
