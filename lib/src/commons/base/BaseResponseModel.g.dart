// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel<T> _$BaseResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return BaseResponseModel<T>(
    fromJsonT(json['content']),
    json['code'] as int?,
    json['message'] == null
        ? null
        : ServerMessageError.fromJson(json['message'] as Map<String, dynamic>),
    json['version'] as String?,
  );
}

Map<String, dynamic> _$BaseResponseModelToJson<T>(
  BaseResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': toJsonT(instance.content),
      'version': instance.version,
    };
