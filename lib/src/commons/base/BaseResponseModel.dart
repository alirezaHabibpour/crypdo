import 'package:json_annotation/json_annotation.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';

part 'BaseResponseModel.g.dart';



@JsonSerializable(genericArgumentFactories: true)
class BaseResponseModel<T> {
  final int? code;
  final ServerMessageError? message;
  final T content;
  final String? version;

  const BaseResponseModel(this.content, this.code, this.message, this.version);
  factory BaseResponseModel.fromJson(Map<String, dynamic> json,T Function(Object? json) fromJsonT) => _$BaseResponseModelFromJson(json,fromJsonT);

 }





