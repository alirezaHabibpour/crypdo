import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
 import 'package:crypdo/src/commons/utils/style/global_style.dart';
import 'package:crypdo/src/commons/utils/widgets/KeyPad.dart';
import 'package:crypdo/src/commons/utils/extionsions.dart';
import 'package:crypdo/src/features/contacts/contact_entities.dart';
import 'package:crypdo/src/features/contacts/views/view_contacts_root.dart';
import 'package:crypdo/src/features/contacts/views/view_select_contacts.dart';
import 'package:crypdo/src/features/transfer/views/transfer_entities.dart';
import 'package:crypdo/src/features/transfer/views/view_transfer_root.dart';

class TransferValueScreen extends StatefulWidget {

  final void Function(ContactDto,CryptoDto,int) inquiryCallback;

  TransferValueScreen(this.inquiryCallback);

  @override
  _TransferValueScreenState createState() => _TransferValueScreenState();
}

class _TransferValueScreenState extends State<TransferValueScreen> {
  TextEditingController valueController = TextEditingController(text: '');

  List<CryptoDto> cryptos = [
    CryptoDto(
        name: 'Ethereum',
        nickName: 'ETH',
        logoUrl:
            'https://www.uplooder.net/img/image/67/b0db6f7dd1393f507c13167189ed84d5/Ethereum.svg',
        color: 0xFFA7DEFE,
        cryptoValueInIRR: 20000),
    CryptoDto(
        name: 'Tron',
        nickName: 'TRX',
        logoUrl:
            'https://www.uplooder.net/img/image/41/68b7c2efc2173e7cecc1036bccce2da8/tron.svg',
        color: 0xFF950919,
        cryptoValueInIRR: 500000),
    CryptoDto(
        name: 'Bitcoin',
        nickName: 'BTC',
        logoUrl:
            'https://www.uplooder.net/img/image/70/1766f6755c29cfb724c0ef3421ae68a9/Bitcoin.svg',
        color: 0xFFF5A266,
        cryptoValueInIRR: 1000000),
    CryptoDto(
        name: 'Cardano',
        nickName: 'ADA',
        logoUrl:
            'https://www.uplooder.net/img/image/41/68b7c2efc2173e7cecc1036bccce2da8/tron.svg',
        color: 0xFFEEE3A6,
        cryptoValueInIRR: 400000),
  ];

  final PageController pagerController =
      PageController(initialPage: 1, viewportFraction: 0.5);
  int selectedCryptoIndex = 1;
  int calculatedCryptoValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 60,
            child: PageView.builder(
              onPageChanged: (position) {
                setState(() {
                  selectedCryptoIndex = position;
                  try {
                    calculatedCryptoValue = (double.parse(
                        valueController
                            .text) *
                        cryptos[selectedCryptoIndex]
                            .cryptoValueInIRR).toInt()
                    ;
                  } on Exception catch (_) {
                    calculatedCryptoValue = 0;
                  }
                });
              },
              itemBuilder: (BuildContext context, int itemIndex) {
                return _buildChip(cryptos[itemIndex],
                    itemIndex == selectedCryptoIndex);
              },
              itemCount: 4,
              controller: pagerController,
            ),
          ),
          TextField(
            style: GlobalStyle.textH4BigWhite,
            controller: valueController,
            readOnly: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(top: 5),
                border: InputBorder.none,
                hintText: '0.00',
                hintStyle: TextStyle(color: GlobalStyle.greyColor)),
          ),
          RichText(
              text: TextSpan(
                  style: GlobalStyle.textH0Black,
                  children: [

                    TextSpan(
                        text: "in usd :",
                        style: GlobalStyle.textH3Grey),
                    TextSpan(
                        text: " ${calculatedCryptoValue.toPriceFormat}  ",
                        style: GlobalStyle.textH3Grey),


                  ])),
          Container(
            height: 50,
            width: 250,
            margin: EdgeInsets.only(top: 20),
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
                Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) {
                      return ContactsRootScreen((contact){
                        Future.delayed(Duration(milliseconds: 200)).then((value) => {
                        Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) {
                        return TransferRoot(contact :contact, crypto: cryptos[selectedCryptoIndex],amount : double.parse(valueController.text).toInt());
                        }

                        ))
                        });

                       });
                    }
                ));
              },
              child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children:[Text(' contact choice ',style: GlobalStyle.textH2BWhite) ,  Icon(Icons.account_circle),SizedBox(width: 10,)]
              ),
            ),
          ),
          KeyPad(
            textController: valueController,
            isPinLogin: false,
            onChange: (String pin) {
              try {
                calculatedCryptoValue =
                    (double.parse(pin) *
                        cryptos[selectedCryptoIndex]
                            .cryptoValueInIRR)
                        .toInt();
              } on Exception catch (_) {
                calculatedCryptoValue = 0;
              }
              setState(() {});
            },
            onSubmit: (String pin) {},
          ),
        ],
      ),
    );
  }
}

Widget _buildChip(CryptoDto crypto, bool selected) {
  return Padding(
      padding: EdgeInsets.all(3),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selected
                  ? GlobalStyle.orangeColor
                  : GlobalStyle.boxEndColor.withOpacity(0.3)),
          margin: EdgeInsets.all(4),
          child: Align(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(
                alignment: Alignment.center,
                child: Text(crypto.name, style: GlobalStyle.textH0BWhite),
              ),
              Padding(padding: EdgeInsets.all(4)),
              SvgPicture.network(
                crypto.logoUrl,
                width: 30,
                height: 30,
              ),
              Padding(padding: EdgeInsets.all(3)),
            ]),
          )));
}
