import 'package:crypdo/src/commons/base/BaseRepository.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
import 'package:dartz/dartz.dart';

import 'currency__entities.dart';
import 'currency_network.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, List<CurrencyModel> >> getCurrencyData(String mobileNumber);

}

class CurrencyRepositoryImp extends BaseRepository implements CurrencyRepository {
  final CurrencyNetwork network;

  CurrencyRepositoryImp(this.network);

  @override
  Future<Either<Failure, List<CurrencyModel> >> getCurrencyData(String mobileNumber) async {
      return await requestRemote(
              () => network.getCurrencyData(mobileNumber),
          transferCurrencyData,
          []);
  }




  List<CurrencyModel>  transferCurrencyData(List<CurrencyModel> balance) {
    return balance;
  }


}


