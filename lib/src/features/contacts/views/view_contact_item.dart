import 'package:crypdo/src/commons/utils/style/global_style.dart';
import 'package:crypdo/src/features/contacts/contact_entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  ContactItem extends StatelessWidget{

  final ContactDto contact;
  ContactItem(this.contact);
  @override
  Widget build(BuildContext context
      ) {
      return Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            CircleAvatar(maxRadius: 25,child: Icon(Icons.contacts),)
            ,SizedBox(width:GlobalStyle.paddingHalfInsetAll,height: GlobalStyle.paddingHalfInsetAll),
            Column(
              children : [
              Text('${contact.name}  ${contact.family}',style: GlobalStyle.textH3White,),
              Text('${contact.mobileNumber}  ',style: GlobalStyle.textH2Grey,),
              ]
              ,
            )
          ]
        ),
      );
  }

}