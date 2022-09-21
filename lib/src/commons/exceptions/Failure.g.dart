// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerMessageError _$ServerMessageErrorFromJson(Map<String, dynamic> json) {
  return ServerMessageError(
    json['message'] as String?,
    json['code'] as int?,
  );
}

Map<String, dynamic> _$ServerMessageErrorToJson(ServerMessageError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
