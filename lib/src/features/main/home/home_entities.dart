
import 'package:crypdo/src/commons/base/BaseEvent.dart';
import 'package:crypdo/src/commons/base/BaseStatus.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_entities.g.dart';


class HomeStatus extends BaseStatus {
  HomeStatus({Failure? fail, bool? progress, this.homeData})
      : super(failure: fail, progress: progress);
   HomeModel? homeData;
}

class HomeEvent extends BaseEvent {}
class GetHomeDataEvent extends HomeEvent{}


@JsonSerializable()
class HomeModel {
  HomeModel(
      {this.wallet,
      this.titleItems});

  WalletModel? wallet;
  List<TilesModel>? titleItems;


  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

}


@JsonSerializable()
class TilesModel {
  TilesModel(
      {this.key,
        this.nameEn,
        this.icon,
     });

  String? key;
  String? nameEn;
  String? icon;


  factory TilesModel.fromJson(Map<String, dynamic> json) => _$TilesModelFromJson(json);
  Map<String, dynamic> toJson() => _$TilesModelToJson(this);


}


@JsonSerializable()
class WalletModel {
  WalletModel(
      {this.balance});

  double? balance;


  factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);
  Map<String, dynamic> toJson() => _$WalletModelToJson(this);


}

const WALLET_TAB_TITLE = 'wallet';
const WALLET_BALANCE = 'balance';
const CURRENCY_TAB_TITLE = 'currencies';

