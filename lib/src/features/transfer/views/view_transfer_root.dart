import 'package:flutter/material.dart';
import 'package:crypdo/src/commons/base/view_base_bottom_sheet_stack.dart';
import 'package:crypdo/src/features/contacts/contact_entities.dart';
import 'package:crypdo/src/features/transfer/views/transfer_entities.dart';
import 'package:crypdo/src/features/transfer/views/view_transfer.dart';
import 'package:crypdo/src/features/transfer/views/view_transfer_confirm.dart';

class TransferRoot extends StatefulWidget {
  @override
  State<TransferRoot> createState() {
    return TransferRootState();
  }


final ContactDto? contact;
final CryptoDto? crypto;
final int? amount;

  TransferRoot( {this.contact ,   this.crypto ,   this.amount});

}


class TransferRootState
    extends BaseBottomSheetNavigationRootState<TransferRoot> {
  @override
  void initState() {
    Future.delayed(Duration(microseconds: 200)).then((value) async {
      if(widget.amount!=null) {
           addBottomSheetToStack(
              'confirm transfer',
              context,
              'https://www.uplooder.net/img/image/100/5e2b8aecabb178be1ac2c5f51c9af5fb/switch.svg',
              TransferConfirmScreen( contact:widget.contact!,crypto: widget.crypto!,amount: widget.amount!),
              true);
         return;
      }

      addBottomSheetToStack(
          'transfer',
          context,
          'https://www.uplooder.net/img/image/100/5e2b8aecabb178be1ac2c5f51c9af5fb/switch.svg',
          TransferValueScreen((contact, crypto, amount) {

           }),
          true);
    });
  }


}
