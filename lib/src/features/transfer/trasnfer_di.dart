import 'package:get_it/get_it.dart';
import 'package:crypdo/src/commons/di/networkServiceLocator.dart';
import 'package:dio/dio.dart';
import 'package:crypdo/src/features/transfer/transfer_bloc.dart';
import 'package:crypdo/src/features/transfer/transfer_network.dart';
import 'package:crypdo/src/features/transfer/transfer_repository.dart';
import 'package:crypdo/src/features/user/user_repository.dart';


GetIt getIt = GetIt.I;

setUpTransferServiceLocator() {
  getIt.registerSingletonWithDependencies<TransferRepository>(
        () => TransferRepositoryImp(
            TransferNetwork(getIt.get(instanceName: AUTHENTICATED_DIO_CLIENT))),
    dependsOn: [InitDependency(Dio, instanceName: AUTHENTICATED_DIO_CLIENT)],
  );

  getIt.registerFactory<TransferBloc>(
          () => TransferBloc(getIt.get<TransferRepository>(),getIt.get<UserRepository>()));
}