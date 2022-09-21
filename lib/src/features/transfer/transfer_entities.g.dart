// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferRequestModel _$TransferRequestModelFromJson(Map<String, dynamic> json) {
  return TransferRequestModel(
    json['srcMobileNumber'] as String?,
    json['targetMobileNumber'] as String?,
    json['amount'] as int?,
  );
}

Map<String, dynamic> _$TransferRequestModelToJson(
        TransferRequestModel instance) =>
    <String, dynamic>{
      'srcMobileNumber': instance.srcMobileNumber,
      'targetMobileNumber': instance.targetMobileNumber,
      'amount': instance.amount,
    };
