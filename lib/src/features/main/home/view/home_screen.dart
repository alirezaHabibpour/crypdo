import 'dart:async';

import 'package:blur/blur.dart';
import 'package:crypdo/src/commons/base/BaseScreen.dart';
import 'package:crypdo/src/commons/utils/style/global_style.dart';
import 'package:crypdo/src/features/main/home/currency_items/view/currency_screen.dart';
import 'package:crypdo/src/features/transfer/views/view_transfer_root.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexagon/hexagon.dart';

import '../home_entities.dart';
import '../home_screen_bloc.dart';

class HomeScreen extends BaseBlocScreen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createBaseState() => _HomeScreenState();
}

class _HomeScreenState
    extends BaseState<HomeEvent, HomeStatus, HomeBloc, HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Timer timer ;
   double position = 0;
   bool revers = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    blocProvider().add(GetHomeDataEvent());

    timer= Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
         if(position< - 450) revers=true;
         if(position> -0) revers =false;


          if(revers){
            if(position>200)  position+=2;else position+=5;
          }else {
            if(position<-200)  position-=2;else position-=5;
          }

      });
    });
   }

  @override
  void dispose() {
     super.dispose();
     timer.cancel();
  }

  @override
  Widget buildChildWidget() {
    return BlocBuilder<HomeBloc, HomeStatus>(builder: (context, status) {
      if (status.homeData != null) {
        return Scaffold(

           body: SafeArea(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomLeft,colors:
                [
                  GlobalStyle.primaryColor,
                  GlobalStyle.boxStartColor

                ]
                )

              ),
              child: Stack(
                children: [
                    AnimatedPositioned(
                      duration: Duration(microseconds: 1000),
                      right: position,
                      height: 270,

                      child:   Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Image(
                          height: 250,
                               image: AssetImage("assets/images/ui/waves.png"),
                              fit: BoxFit.cover,
                            ),
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.only(left: 24 ,right: 24,top:5),
                    child: Column(
                      children: [

                        Container(
                          height:30,
                          child: chipList(),
                        )
                        ,
                         Container(
                           margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: GlobalStyle.whiteColor,width: 0.3,)),

                          child: Column(
                            children: [
                              Container(
                                height: GlobalStyle.tabHeight,
                                margin: const EdgeInsets.only(top: 10.0 ,left:10,right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: GlobalStyle.primaryColor
                                         ,
                                      spreadRadius: 2,
                                      blurRadius: 6,
                                     // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: TabBar(
                                  controller: _tabController,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                    color: GlobalStyle.boxEndColor ,
                                  ),
                                  labelColor: Colors.white,
                                  unselectedLabelColor:
                                      GlobalStyle.greyColor ,
                                   tabs: [
                                    Tab(
                                      text: CURRENCY_TAB_TITLE,

                                    ),
                                    Tab(
                                      text: WALLET_TAB_TITLE,

                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 180,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    CurrencyScreen(),
                                   Container(),
                                  ],
                                ),
                              ),
                            ],
                          ).frosted(
                            blur: 30,
                            frostColor: GlobalStyle.walletBackColor.withOpacity(0.3),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'all',
                                style: GlobalStyle.textH1White,
                              ),
                              Text(
                                'services',
                                style: GlobalStyle.textH1White,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          color: Colors.transparent,
                          margin: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: status.homeData?.titleItems?.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return GestureDetector(
                                  onTap: ()=>{
                                  Navigator.of(context).push(PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder: (BuildContext context, _, __) {
                                        return TransferRoot();
                                      }
                                  ))
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 25, right: 25, top: 10, bottom: 10),
                                    width: 70,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                            Row(
                                              children: [
                                                SvgPicture.network(
                                                  status.homeData?.titleItems?[index]
                                                      ?.icon ??
                                                      "",
                                                  width: 20,
                                                  height: 20,
                                                  color: GlobalStyle.whiteColor,
                                                ),
                                                Padding(padding: EdgeInsets.all(10)),
                                                Container(
                                                  width: 2,
                                                  height: 30,
                                                  color: GlobalStyle.greyColor
                                                      .withOpacity(0.5),
                                                ),
                                                Padding(padding: EdgeInsets.all(5)),
                                                Text(
                                                  status.homeData?.titleItems?[index]
                                                      ?.nameEn ??
                                                      "",
                                                  style: GlobalStyle.textH1White,
                                                ),
                                              ],
                                            ),
                                        Icon(
                                          Icons.arrow_right,
                                          color: GlobalStyle.whiteColor,
                                        ),

                                      ],
                                    ),
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        GlobalStyle.boxEndColor.withOpacity(0.9),
                                        GlobalStyle.boxEndColor.withOpacity(0.2),
                                      ]),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: GlobalStyle.primaryColor
                                              .withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return Text('OOPS!');
    });
  }
}


Widget _buildChip(String label, Color color) {
  return Padding(
    padding: EdgeInsets.all(3),
    child: Container(
      margin: EdgeInsets.all(4),
      child: Row(
        children:[
          Padding(padding: EdgeInsets.all(3)),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              HexagonWidget(
               type: HexagonType.POINTY,
               color: color,
               width: 25,
               height: 25,
         ),
              HexagonWidget(
                type: HexagonType.POINTY,
                color: GlobalStyle.blackColor,
                width: 13,
                height:13,
              ),     HexagonWidget(
                type: HexagonType.POINTY,
                color: color,
                width: 10,
                height:10,
              ),

            ],
          ),
        Padding(padding: EdgeInsets.all(2)),
        Text(
          label,
          style:  GlobalStyle.textH0BWhite
        ),
          Padding(padding: EdgeInsets.all(3)),

        ]
       )
    ).frosted(
      padding: EdgeInsets.all(0.8),
      blur: 30,
      frostColor: GlobalStyle.boxEndColor ,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );
}
chipList() {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      _buildChip('BTC : 29%', GlobalStyle.bitcoinColor),
      _buildChip('ETH : 24%', GlobalStyle.ethereumColor),
      _buildChip('ADA : 30%', GlobalStyle.cardanoColor),
      _buildChip('BTC : 29%', GlobalStyle.bitcoinColor),
      _buildChip('BTC : 29%', GlobalStyle.bitcoinColor),

    ],
  );
}

