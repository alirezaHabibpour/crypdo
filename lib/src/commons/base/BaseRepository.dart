// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:crypdo/src/commons/base/BaseResponseModel.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
import 'package:dio/dio.dart';

abstract class BaseRepository {

  Future<Either<Failure, R>> requestRemote<T, R>(
      Future<T> Function() call, R Function(T) transform,
      R defaultOutput) async {
    try {
      var response = await call();
         return Right(transform(response!));

    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        return Left(NetworkConnection());
      }
      return Left(ServerMessageError(
          e.response?.statusMessage!, e.response?.statusCode!));
    }
  }
}


