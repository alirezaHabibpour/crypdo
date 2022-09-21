import 'dart:ffi';

import 'package:crypdo/src/commons/base/BaseEvent.dart';
import 'package:crypdo/src/commons/base/BaseStatus.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency__entities.g.dart';


class CurrencyStatus extends BaseStatus {
  List<CurrencyModel>? currencyData;

CurrencyStatus({Failure? fail, bool? progress, this.currencyData})
      : super(failure: fail, progress: progress);
}

@JsonSerializable()
class CurrencyModel {
  CurrencyModel(
      {this.name,
        this.count,
        this.color});

  String? name;
  double? count;
  String? color;


  factory CurrencyModel.fromJson(Map<String, dynamic> json) => _$CurrencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);

}

class CurrencyEvent extends BaseEvent {}
class CurrencyDataEvent extends CurrencyEvent{}