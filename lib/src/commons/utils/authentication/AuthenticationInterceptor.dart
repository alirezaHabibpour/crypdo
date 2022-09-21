import 'package:dio/dio.dart';
import 'AuthenticationRepository.dart';



class AuthenticationInterceptor implements Interceptor {
  final AuthenticationRepository repository;

  AuthenticationInterceptor({required this.repository});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if( repository.getAuthToken() == null) handler.next(options);
    options.headers["Authorization"] = "Bearer " + repository.getAuthToken()!;
    return handler.next(options);

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);

  }



}
