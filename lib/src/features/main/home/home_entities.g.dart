// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
    wallet: json['wallet'] == null
        ? null
        : WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
    titleItems: (json['titleItems'] as List<dynamic>?)
        ?.map((e) => TilesModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'wallet': instance.wallet,
      'titleItems': instance.titleItems,
    };

TilesModel _$TilesModelFromJson(Map<String, dynamic> json) {
  return TilesModel(
    key: json['key'] as String?,
    nameEn: json['nameEn'] as String?,
    icon: json['icon'] as String?,
  );
}

Map<String, dynamic> _$TilesModelToJson(TilesModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'nameEn': instance.nameEn,
      'icon': instance.icon,
    };

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return WalletModel(
    balance: (json['balance'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$WalletModelToJson(WalletModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
    };
