import 'package:dartz/dartz.dart';
import 'package:crypdo/src/commons/base/BaseRepository.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
import 'package:crypdo/src/features/main/home/home_entities.dart';

import 'home_network.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> getHomeData();

}

class HomeRepositoryImp extends BaseRepository implements HomeRepository {
  final HomeNetwork network;

  HomeRepositoryImp(this.network);


  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    return await requestRemote(
            () => network.getHomeData(),
        transferHomeData,
        HomeModel());
  }


  HomeModel transferHomeData(HomeModel homeData) {
    return homeData;
  }


}


