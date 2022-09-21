
import 'package:dartz/dartz.dart';
import 'package:crypdo/src/commons/base/BaseRepository.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
import 'package:crypdo/src/features/contacts/contact_entities.dart';
import 'package:crypdo/src/features/contacts/contact_network.dart';

abstract class ContactsRepository {
  Future<Either<Failure, List<ContactDto>>> getContacts();

}

class ContactsRepositoryImp extends BaseRepository implements ContactsRepository {
  final ContactsNetwork network;

  ContactsRepositoryImp(this.network);

  @override
  Future<Either<Failure, List<ContactDto>>> getContacts() async {
    return await requestRemote(
            () => network.getContacts(),
        _transferContacts,
        []);
  }

  List<ContactDto> _transferContacts(List<ContactDto> it){
    return it ;
  }







}


