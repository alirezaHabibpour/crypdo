
import 'package:flutter/material.dart';
import 'package:crypdo/src/commons/base/view_base_bottom_sheet_stack.dart';
import 'package:crypdo/src/features/contacts/views/view_select_contacts.dart';

import '../contact_entities.dart';



class ContactsRootScreen extends StatefulWidget{

    void Function(ContactDto)? selectCallback;
    ContactsRootScreen( this.selectCallback);


    @override
  _ContactsRootScreenState createState() => _ContactsRootScreenState();
}

class _ContactsRootScreenState extends BaseBottomSheetNavigationRootState<ContactsRootScreen> {


  @override
  void initState() {
    Future.delayed(Duration(microseconds: 200)).then((value) async {
      addBottomSheetToStack(
          'Choose Contact',
          context,
          'https://www.uplooder.net/img/image/100/5e2b8aecabb178be1ac2c5f51c9af5fb/switch.svg',
          SelectContactScreen(selectCallback: (contact ) {
              widget.selectCallback?.call(contact);
              Navigator.of(context).pop();
           },),
          true);
    });
  }
}


