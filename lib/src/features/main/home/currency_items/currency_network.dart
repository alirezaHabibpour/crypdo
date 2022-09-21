import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import 'currency__entities.dart';

part 'currency_network.g.dart';

@RestApi()
abstract class CurrencyNetwork {
  factory CurrencyNetwork(Dio dio, {String baseUrl}) = _CurrencyNetwork;

  @GET("/api/v1/assets")
  Future<List<CurrencyModel>> getCurrencyData(@Path('mobileNumber')String mobileNumber);

}