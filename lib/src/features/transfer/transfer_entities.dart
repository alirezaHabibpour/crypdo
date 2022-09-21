
import 'package:crypdo/src/commons/base/BaseEvent.dart';
import 'package:crypdo/src/commons/base/BaseStatus.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer_entities.g.dart';


class TransferEvent extends BaseEvent{
  final TransferRequestModel request;
  TransferEvent({required this.request});
}


class TransferStatus extends BaseStatus{
  bool? isTransferSuccess;
  TransferStatus({Failure? fail, bool? progress,this.isTransferSuccess}) : super(failure: fail, progress: progress);
}


@JsonSerializable()
class TransferRequestModel{
  String? srcMobileNumber;
  String? targetMobileNumber;
  int? amount;

  TransferRequestModel(this.srcMobileNumber,this.targetMobileNumber,this.amount);


  factory TransferRequestModel.fromJson(Map<String, dynamic> json) => _$TransferRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransferRequestModelToJson(this);

}