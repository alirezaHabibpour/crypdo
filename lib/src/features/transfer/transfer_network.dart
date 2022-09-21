import 'package:retrofit/http.dart';
import 'package:crypdo/src/features/transfer/transfer_entities.dart';
import 'package:dio/dio.dart';



part 'transfer_network.g.dart';

@RestApi()
abstract class TransferNetwork {
  factory TransferNetwork(Dio dio, {String baseUrl}) = _TransferNetwork;

  @POST("/crypdo/api/transfer")
  Future<String> requestTransfer(@Body() TransferRequestModel request);



}

