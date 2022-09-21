import 'AuthenticationPrefManger.dart';

abstract class AuthenticationRepository {
  String? getAuthToken();
}

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final AuthenticationPrefManger prefManger;

  AuthenticationRepositoryImp({required this.prefManger});

  @override
  String? getAuthToken() {
    return prefManger.getAuthToken() ?? "";
  }
}
