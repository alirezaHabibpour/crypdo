import 'dart:io';

import 'package:get_it/get_it.dart';
 import 'package:shared_preferences/shared_preferences.dart';


GetIt getIt = GetIt.I;
const String BASE_PREFERENCES_NAME = "BASE_PREFERENCES_NAME";
const String BASE_PREFERENCES = "BASE_PREFERENCES";

setUpPreferenceServiceLocator() {


  getIt.registerSingletonAsync<SharedPreferences>(() async {
     return await SharedPreferences.getInstance();
  }, instanceName: BASE_PREFERENCES);
}
