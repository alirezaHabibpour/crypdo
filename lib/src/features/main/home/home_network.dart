import 'package:retrofit/http.dart';
import 'package:crypdo/src/features/main/home/home_entities.dart';
import 'package:dio/dio.dart';

part 'home_network.g.dart';

@RestApi()
abstract class HomeNetwork {
  factory HomeNetwork(Dio dio, {String baseUrl}) = _HomeNetwork;

  @GET("/api/v1/home")
  Future<HomeModel> getHomeData();

}