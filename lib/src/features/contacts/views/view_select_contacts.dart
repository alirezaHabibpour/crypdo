import 'package:crypdo/src/commons/base/BaseScreen.dart';
import 'package:crypdo/src/commons/utils/style/global_style.dart';
import 'package:crypdo/src/features/contacts/contact_entities.dart';
import 'package:crypdo/src/features/contacts/contacts_bloc.dart';
import 'package:crypdo/src/features/contacts/views/view_contact_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectContactScreen extends BaseBlocScreen {
  final void Function(ContactDto) selectCallback;

  SelectContactScreen({required this.selectCallback});

  @override
  _SelectContactScreenState createBaseState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends BaseState<ContactsEvent,
    ContactSelectStatus, ContactsBloc, SelectContactScreen> {


  @override
  void initState() {
    super.initState();
     blocProvider().add(GetContactsEvent());
  }
  @override
  Widget buildChildWidget() {
    return BlocBuilder<ContactsBloc, ContactSelectStatus>(
        builder: (context, status) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              style: GlobalStyle.textH3White,
              decoration: InputDecoration(

                  isDense: true,
                    hintText: 'search contact',
                  hintStyle: GlobalStyle.textH2Grey),

            ),
            Padding(padding: EdgeInsets.all(GlobalStyle.paddingInsetAll)),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, index) {
             return GestureDetector(
                 onTap: (){
                   widget.selectCallback.call(status.contacts![index]);
                 },
                 child: ContactItem(status.contacts![index]));
              },
              itemCount: status.contacts!.length,
            )
          ],
        ),
      );
    });
  }
}
