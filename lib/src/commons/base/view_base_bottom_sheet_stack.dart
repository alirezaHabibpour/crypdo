
import 'package:flutter/material.dart';
import 'package:crypdo/src/commons/utils/extionsions.dart';
import 'package:crypdo/src/features/contacts/views/view_select_contacts.dart';
import 'package:crypdo/src/features/transfer/views/view_transfer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexagon/hexagon.dart';
import 'package:crypdo/src/commons/utils/style/global_style.dart';
import 'package:crypdo/src/features/transfer/views/view_transfer.dart';
import 'package:blur/blur.dart';



class BaseBottomSheetNavigationRootState<T extends StatefulWidget> extends State<T> {
  late List<PersistentBottomSheetController> _controllers = [];
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Scaffold(
        backgroundColor: GlobalStyle.blackColor.withOpacity(0.7),
        key: _key,
      ),
    );
  }

    addBottomSheetToStack(
      String title, BuildContext context, String icon, Widget child,bool isRoot) {
      late PersistentBottomSheetController controller;
      controller =_key.currentState!.showBottomSheet(
        (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: Wrap(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.close();
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 5,right: 10),
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.close,
                              color: GlobalStyle.greyColor,
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              title,
                              style: GlobalStyle.textH4BWhite,
                            )),
                        child,
                      ],
                    ),
                  ).frosted(
                      blur: 30,
                      frostColor:
                      GlobalStyle.walletBackColor.withOpacity(0.3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                ),
                HexagonWidget(
                  cornerRadius: 10,
                  type: HexagonType.POINTY,
                  width: 60,
                  height: 60,
                  color: GlobalStyle.greyColor,
                  child: SvgPicture.network(
                    icon,
                    height: 30,
                    width: 30,
                    color: GlobalStyle.whiteColor,
                  ),
                )
              ],
            ),
          ],
        )
        ),
        backgroundColor: Colors.transparent,

      );

   controller.closed.then((value) => {
     if(isRoot) {
       Navigator.of(context).pop()
    }
   });

   _controllers.add(controller);




  }


}



