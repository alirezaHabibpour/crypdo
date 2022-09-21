import 'package:shared_preferences/shared_preferences.dart';
import 'AuthenticationDtos.dart';
abstract class  AuthenticationPrefManger{

  String? getAuthToken();
}


class AuthenticationPrefMangerImp implements AuthenticationPrefManger{


  final SharedPreferences defaultPreferences;

  AuthenticationPrefMangerImp({required this.defaultPreferences});
  
  @override
  String? getAuthToken() {
  return defaultPreferences.getString(AUTHENTICATION_TOKEN);
  }

}