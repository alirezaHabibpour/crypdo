import 'package:get_it/get_it.dart';
import 'package:crypdo/src/commons/di/networkServiceLocator.dart';
import 'package:dio/dio.dart';

import '../home_network.dart';
import '../home_repository.dart';
import '../home_screen_bloc.dart';

GetIt getIt = GetIt.I;

setUpHomeServiceLocator() {
  getIt.registerSingletonWithDependencies<HomeRepository>(
        () => HomeRepositoryImp(
            HomeNetwork(getIt.get(instanceName: MOCK_DIO_CLIENT))),
    dependsOn: [InitDependency(Dio, instanceName: MOCK_DIO_CLIENT)],
  );

  getIt.registerFactory<HomeBloc>(
          () => HomeBloc(getIt.get<HomeRepository>()));
}