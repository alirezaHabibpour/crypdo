import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypdo/src/commons/utils/style/global_style.dart';
import 'package:crypdo/src/features/main/home/home_entities.dart';

class WalletScreen extends StatelessWidget {

  final double? balance;


  const WalletScreen( this.balance, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(



        decoration: BoxDecoration(
        color: Colors.transparent,


        ),


     child:  Column(

       children: [
         SizedBox(height: 15),


         Text(WALLET_BALANCE,
         style: GlobalStyle.textH0BWhite,),
         Text(balance.toString() + "  usd ",
             style: GlobalStyle.textH2BWhite),

       ],
     ),
    );
  }
}