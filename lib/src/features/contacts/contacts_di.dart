import 'package:get_it/get_it.dart';
import 'package:crypdo/src/commons/di/networkServiceLocator.dart';
import 'package:dio/dio.dart';
import 'package:crypdo/src/features/contacts/contact_network.dart';
import 'package:crypdo/src/features/contacts/contacts_bloc.dart';
import 'package:crypdo/src/features/main/home/currency_items/contact_repository.dart';
import 'package:crypdo/src/features/user/user_repository.dart';



GetIt getIt = GetIt.I;

setUpContactsServiceLocator() {
  getIt.registerSingletonWithDependencies<ContactsRepository>(
        () => ContactsRepositoryImp(
            ContactsNetwork(getIt.get(instanceName: MOCK_DIO_CLIENT))),
    dependsOn: [InitDependency(Dio, instanceName: MOCK_DIO_CLIENT)],
  );

  getIt.registerFactory<ContactsBloc>(
          () => ContactsBloc(getIt.get<ContactsRepository>()));
}