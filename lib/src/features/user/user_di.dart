

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypdo/src/commons/di/preferenceServiceLocator.dart';
import 'package:crypdo/src/features/user/user_pref_manager.dart';
import 'package:crypdo/src/features/user/user_repository.dart';


GetIt getIt = GetIt.I;


setUpUserServiceLocator() {

  getIt.registerSingletonWithDependencies<UserPrefManger>(
          () => UserPrefMangerImp(
          defaultPreferences: getIt.get<SharedPreferences>(instanceName: BASE_PREFERENCES)),
      dependsOn: [InitDependency(SharedPreferences, instanceName: BASE_PREFERENCES)]);

  getIt.registerSingletonWithDependencies<UserRepository>(
          () => UserRepositoryImp(pref: getIt.get<UserPrefManger>())
      ,dependsOn: [UserPrefManger]);
}