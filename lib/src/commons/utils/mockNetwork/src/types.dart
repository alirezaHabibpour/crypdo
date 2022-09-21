import 'package:dio/dio.dart';
import 'package:crypdo/src/commons/utils/mockNetwork/src/handlers/request_handler.dart';
import 'package:crypdo/src/commons/utils/mockNetwork/src/mixins/mixins.dart';
import 'package:crypdo/src/commons/utils/mockNetwork/src/request.dart';
import 'package:crypdo/src/commons/utils/mockNetwork/src/response.dart';

/// Type for request handler callbacks in the [RequestHandling].
typedef MockServerCallback = void Function(MockServer server);

/// Type for [Recording]'s [ResponseBody], which takes [RequestOptions] as a parameter
/// and compares its signature to saved [Request]'s signature and chooses right response.
typedef MockResponseBodyCallback = MockResponse Function(
  RequestOptions options,
);
