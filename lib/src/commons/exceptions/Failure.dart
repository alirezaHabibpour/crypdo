import 'package:json_annotation/json_annotation.dart';

part 'Failure.g.dart';

abstract class Failure {}

abstract class GeneralFailure extends Failure{

}
class InternalServer implements GeneralFailure {}

class Forbidden implements GeneralFailure {
  final String message;

  Forbidden(this.message);
}

@JsonSerializable()
class ServerMessageError implements GeneralFailure {
  final String? message;
  final int? code;

  ServerMessageError(this.message, this.code);
  factory ServerMessageError.fromJson(Map<String, dynamic> json) => _$ServerMessageErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ServerMessageErrorToJson(this);
}

class NetworkConnection implements GeneralFailure {}
