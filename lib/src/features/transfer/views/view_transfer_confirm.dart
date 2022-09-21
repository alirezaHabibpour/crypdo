import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypdo/src/commons/base/BaseScreen.dart';
import 'package:crypdo/src/commons/utils/style/global_style.dart';
import 'package:crypdo/src/features/contacts/contact_entities.dart';
import 'package:crypdo/src/features/transfer/transfer_bloc.dart';
import 'package:crypdo/src/features/transfer/transfer_entities.dart';
import 'package:crypdo/src/features/transfer/views/transfer_entities.dart';
import 'package:crypdo/src/commons/utils/extionsions.dart';
import 'package:crypdo/src/features/transfer/transfer_entities.dart';


class TransferConfirmScreen extends BaseBlocScreen {

 final ContactDto contact;
 final CryptoDto crypto;
 final int amount;

 TransferConfirmScreen({required this.contact , required this.crypto , required this.amount});
 @override
 _TransferConfirmScreenState createBaseState() => _TransferConfirmScreenState();

}



class _TransferConfirmScreenState extends BaseState<TransferEvent, TransferStatus,
    TransferBloc, TransferConfirmScreen> with SingleTickerProviderStateMixin {
  @override
  Widget buildChildWidget() {
    return BlocBuilder<TransferBloc, TransferStatus>(
        builder: (context, status) {

          if(status.isTransferSuccess==true){
            Future.delayed(Duration(milliseconds: 100)).then((value) => {
                 Navigator.of(context).pop(),
                Navigator.of(context).pop()
            });

            return Container(color:Colors.transparent,);
          }
          return Container(
            padding: EdgeInsets.all(30),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(maxRadius: 25, child: Icon(Icons.contacts),)
                      ,
                     Padding(padding: EdgeInsets.all(GlobalStyle.widthTextSmall)),

                      Text('${widget.contact.name}  ${widget.contact.family}',
                        style: GlobalStyle.textH3White,),
                    ]
                ),

                Padding(padding: EdgeInsets.all(GlobalStyle.paddingHalfInsetAll)),
                Container(
                  height: GlobalStyle.heightSeparator,
                   color: GlobalStyle.greyColor,
                ),
                Padding(padding: EdgeInsets.all(GlobalStyle.paddingHalfInsetAll)),
                Text(' currency :',style: GlobalStyle.textH2Grey,),
                Padding(padding: EdgeInsets.all(GlobalStyle.textHeight)),

                Text(widget.crypto.name,style: GlobalStyle.textH3White,),

                Padding(padding: EdgeInsets.all(GlobalStyle.paddingHalfInsetAll)),
                Text('amount :',style: GlobalStyle.textH2Grey,),
                Padding(padding: EdgeInsets.all(GlobalStyle.textHeight)),

                Text(widget.amount.toString(),style: GlobalStyle.textH3White),

                Padding(padding: EdgeInsets.all(GlobalStyle.paddingHalfInsetAll)),
                Text('in usd :',style: GlobalStyle.textH2Grey,),
                Padding(padding: EdgeInsets.all(GlobalStyle.textHeight)),
                Text((widget.crypto.cryptoValueInIRR*widget.amount).toPriceFormat,style: GlobalStyle.textH3White),

                Padding(padding: EdgeInsets.all(GlobalStyle.paddingInsetAll)),


               Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children : [

                   Container(
                   width: 250,
                   height: 50,
                   child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(
                              GlobalStyle.boxStartColor
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),

                      onPressed: () {
                        blocProvider().add( TransferEvent( request:TransferRequestModel(null,widget.contact.mobileNumber.toString(),widget.amount)));
                       },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[  SizedBox(width: 10,), Text('confirm',style: GlobalStyle.textH2BWhite)]
                      ),
                    ),
                 ),
                 ]
               ),






              ],
            ),
          );
        });
  }

}
