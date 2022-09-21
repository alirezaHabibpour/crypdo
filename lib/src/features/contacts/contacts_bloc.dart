
import 'package:crypdo/src/commons/base/BaseBloc.dart';
import 'package:crypdo/src/features/contacts/contact_entities.dart';
import 'package:crypdo/src/features/main/home/currency_items/contact_repository.dart';
import 'package:crypdo/src/features/user/user_repository.dart';

class ContactsBloc extends BaseBloc<ContactsEvent,ContactSelectStatus> {
final ContactsRepository repository;

ContactsBloc(this.repository)
: super(ContactSelectStatus(fail: null ,progress: true));

@override
Stream<ContactSelectStatus> mapEventToState(ContactsEvent event) async* {
   if(event  is GetContactsEvent){
     yield ContactSelectStatus(fail: null ,progress: true, contacts: [] );
     yield await _mapCurrencyEventToStatus(event);
   }
}

Future<ContactSelectStatus> _mapCurrencyEventToStatus(GetContactsEvent event) async{
   var result = await repository.getContacts();

  ContactSelectStatus? status;

  result.fold((l) => {status = ContactSelectStatus(fail: l ,progress: false, contacts:[] )},
          (r) => {status = ContactSelectStatus(fail: null ,progress: false, contacts: r )});
  return status!;
}



}
