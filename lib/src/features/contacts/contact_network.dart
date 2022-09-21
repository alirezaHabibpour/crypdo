import 'package:crypdo/src/features/contacts/contact_entities.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'contact_network.g.dart';


@RestApi()
abstract class ContactsNetwork {
  factory ContactsNetwork(Dio dio, {String baseUrl}) = _ContactsNetwork;

  @GET("/api/v1/contacts")
  Future<List<ContactDto>> getContacts();

}