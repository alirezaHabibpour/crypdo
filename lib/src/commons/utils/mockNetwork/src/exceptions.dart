import 'package:dio/dio.dart';
import 'package:crypdo/src/commons/utils/mockNetwork/src/adapters/dio_adapter.dart';
import 'package:crypdo/src/commons/utils/mockNetwork/src/interceptors/dio_interceptor.dart';
import 'package:crypdo/src/commons/utils/mockNetwork/src/response.dart';

/// Wrapper of [Dio]'s [DioError] [Exception].
class MockDioError extends DioError implements MockResponse {
  MockDioError({
    required RequestOptions requestOptions,
    Response? response,
    DioErrorType type = DioErrorType.other,
    dynamic error,
  }) : super(
          requestOptions: requestOptions,
          response: response,
          type: type,
          error: error,
        );

  static MockDioError from(DioError dioError) => MockDioError(
        requestOptions: dioError.requestOptions,
        response: dioError.response,
        type: dioError.type,
        error: dioError.error,
      );
}

/// [ClosedException] is thrown when [DioAdapter] or [DioInterceptor]
/// get closed and and then accessed.
class ClosedException implements Exception {
  final dynamic message;

  ClosedException([
    this.message = 'Cannot establish connection!',
  ]);

  @override
  String toString() => 'ClosedException: $message';
}
