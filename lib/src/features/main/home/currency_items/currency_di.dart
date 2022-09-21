import 'package:get_it/get_it.dart';
import 'package:crypdo/src/commons/di/networkServiceLocator.dart';
import 'package:dio/dio.dart';
import 'package:crypdo/src/features/user/user_repository.dart';

import 'currency_bloc.dart';
import 'currency_network.dart';
import 'currency_repository.dart';

GetIt getIt = GetIt.I;

setUpCurrencyServiceLocator() {
  getIt.registerSingletonWithDependencies<CurrencyRepository>(
        () => CurrencyRepositoryImp(
            CurrencyNetwork(getIt.get(instanceName: MOCK_DIO_CLIENT))),
    dependsOn: [InitDependency(Dio, instanceName: MOCK_DIO_CLIENT)],
  );

  getIt.registerFactory<CurrencyBloc>(
          () => CurrencyBloc(getIt.get<CurrencyRepository>(), getIt.get<UserRepository>()));
}