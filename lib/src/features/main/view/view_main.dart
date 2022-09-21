
 import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 import 'package:flutter_svg/svg.dart';
import 'package:hexagon/hexagon.dart';
import 'package:crypdo/src/commons/utils/style/global_style.dart';

import '../home/view/home_screen.dart';

/// This is the stateful widget that the main application instantiates.
class MainStatefulWidget extends StatefulWidget {
  const MainStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MainStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MainStatefulWidget> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue);
  static List<Widget> _widgetOptions = <Widget>[
    Container(
      alignment: Alignment.center,
      color: GlobalStyle.primaryColor,
      child: Text(
        'Transactions',
        style: optionStyle,
      ),
    ),    Container(
      color: GlobalStyle.primaryColor,
      alignment: Alignment.center,
      child: Text(
        'Contacts',
        style: optionStyle,
      ),
    ),
    HomeScreen(),

    Container(
      color: GlobalStyle.primaryColor,
      alignment: Alignment.center,
      child: Text(
        'Market',
        style: optionStyle,
      ),
    ),    Container(
      color: GlobalStyle.primaryColor,
      alignment: Alignment.center,
      child: Text(
        'Profile',
        style: optionStyle,
      ),
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _CURRENCY_TAB_TITLE = 'Crypdo';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalStyle.primaryColor,
        centerTitle: true,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/ui/logo-text.svg' ,height: GlobalStyle.heightLargeImag , width: GlobalStyle.heightLargeImag , color: GlobalStyle.whiteColor,),
            Padding(padding: EdgeInsets.all(5),),
            Text(_CURRENCY_TAB_TITLE,style: TextStyle(fontFamily: 'IranSansRegular'),),

          ],
        ),
      ),
       body:  new Stack(
          alignment: Alignment.bottomCenter,
           children: <Widget>[
            _widgetOptions.elementAt(_selectedIndex),
             Transform.scale(
               scale: 1.02,
               child: Align(
                 alignment: Alignment.bottomCenter,
                 child:   ClipRRect(
                     borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                     child:   Container(
                       color: Colors.transparent,
                       padding: EdgeInsets.only(bottom: GlobalStyle.paddingHalfInsetAll),
                       alignment: Alignment.bottomCenter,
                       width: 1000.0,
                       height: 70.0,
                       child:   Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           BottomMenuBackground(selected: _selectedIndex==0),
                           BottomMenuBackground(selected: _selectedIndex==1),
                           BottomMenuBackground(selected: _selectedIndex==2),
                           BottomMenuBackground(selected: _selectedIndex==3),
                           BottomMenuBackground(selected: _selectedIndex==4),

                         ],
                       ),

                     ),

                 ),
               ),
             ),
              Transform.scale(
                scale: 1.02,
                child: Align(
                  alignment: Alignment.bottomCenter,

                     child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 20.0,
                          sigmaY: 20.0,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              color: GlobalStyle.walletBackColor.withOpacity(0.4),
                              border: Border.all(
                                  color: Colors.white, // Set border color
                                  width: 0.3),   // Set border width
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0),topRight: Radius.circular(35.0)), // Set rounded corner radius
                            ),
                          padding: EdgeInsets.only(bottom: GlobalStyle.paddingHalfInsetAll),
                          alignment: Alignment.bottomCenter,
                          height: 80.0,
                          child:   Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                              BottomMenuItem(icon: 'assets/images/ui/activity.svg',title: 'Transactions', onItemClick: () => _onItemTapped(0) ,selected: _selectedIndex==0),
                              BottomMenuItem(icon: 'assets/images/ui/users.svg',title: 'Contacts',onItemClick: () => _onItemTapped(1) ,selected: _selectedIndex==1),
                              Container( padding :EdgeInsets.only(bottom: 0), width: MediaQuery.of(context).size.width/6
                            ,alignment: Alignment.bottomCenter,child: Text('Trade',style: GlobalStyle.textH2White)),
                              BottomMenuItem(icon: "assets/images/ui/trending-up.svg",title: 'Market',onItemClick: () => _onItemTapped(3) ,selected: _selectedIndex==3),
                              BottomMenuItem(icon: "assets/images/ui/user.svg",title: 'Profile',onItemClick: () => _onItemTapped(4),selected: _selectedIndex==4 ),

                            ],
                          ),
                        ),

                  ),
                   ),
                ),
              ),
             GestureDetector(
               onTap: ()=> _onItemTapped(2),
               child: Container(
                 alignment: Alignment.center,
                height: 135,
                 width: MediaQuery.of(context).size.width/5,
                 child: HexagonWidget(
                  type: HexagonType.POINTY,
                  width: 55,
                  height: 55,
                  color: GlobalStyle.orangeColor,
                  elevation: 20,
                  cornerRadius: 10,
                  child: SvgPicture.asset("assets/images/ui/home.svg" ,height: GlobalStyle.height , width: GlobalStyle.height,color:GlobalStyle.whiteColor,),

                ),
            ),
             ),

           ],

      ),
    );
  }
}

class BottomMenuItem  extends StatelessWidget{

  final String icon;
  final String title;
  final bool selected;
final VoidCallback onItemClick;
  const BottomMenuItem({required this.icon,required this.title,required this.onItemClick, required this.selected});
  @override
  Widget build(BuildContext context) {
    return
        GestureDetector(
          onTap:() => onItemClick.call(),
          child: Container(
             height: 50,
            width: MediaQuery.of(context).size.width/5,
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(icon ,height: GlobalStyle.height , width: GlobalStyle.height,color: selected?GlobalStyle.whiteColor:GlobalStyle.greyColor,),
                Padding(padding: EdgeInsets.all(2)),
                Text(title,style:selected? GlobalStyle.textH0White:GlobalStyle.textH0Grey),
              ],
            ),
          ),
        );
  }

}


class BottomMenuBackground  extends StatelessWidget{

final bool selected;
BottomMenuBackground({required this.selected});

   @override
  Widget build(BuildContext context) {
   if(selected) return
     Container(
        width: MediaQuery.of(context).size.width/5,
        height: 80,
        alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [
                        GlobalStyle.orangeColor,
                        GlobalStyle.orangeColor,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight
                  )
              ),
              child: CircleAvatar(
                  backgroundColor: Colors.transparent

          )
      );
   else return Container(
     width: MediaQuery.of(context).size.width/5,
     height: 80,
     alignment: Alignment.bottomCenter,

   );
  }

}
