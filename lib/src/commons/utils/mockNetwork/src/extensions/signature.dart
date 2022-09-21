import 'package:dio/dio.dart';
import 'package:crypdo/src/commons/utils/mockNetwork/src/request.dart';
import 'package:crypdo/src/commons/utils/mockNetwork/src/utils.dart';

/// [Signature] extension method adds [signature] getter to [RequestOptions]
/// in order to easily retrieve [Request]'s body representation as [String].
extension Signature on RequestOptions {
  /// [signature] is the [String] representation of the [RequestOptions]'s body.
  String get signature => buildRequestSignature(
        method,
        path,
        data,
        queryParameters,
        headers,
      );
}
