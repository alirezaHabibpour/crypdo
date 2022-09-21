import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypdo/src/commons/base/BaseScreen.dart';
import 'package:crypdo/src/commons/utils/style/global_style.dart';
import '../currency__entities.dart';
import '../currency_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

class CurrencyScreen extends BaseBlocScreen {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  _CurrencyScreenState createBaseState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends BaseState<CurrencyEvent, CurrencyStatus,
    CurrencyBloc, CurrencyScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    blocProvider().add(CurrencyDataEvent());
  }

  @override
  Widget buildChildWidget() {
    return BlocBuilder<CurrencyBloc, CurrencyStatus>(
        builder: (context, status) {
      if (status.currencyData == null || status.currencyData?.isEmpty == true)
        return Container();

      Map<String, double> dataMap = {};
      status.currencyData
          ?.forEach((customer) => dataMap[customer.name!] = customer.count!);
      return GestureDetector(
        onTap: () {
          blocProvider().add(CurrencyDataEvent());
        },
        child: new Directionality(
            textDirection: TextDirection.ltr,
            child: PieChart(
              ringStrokeWidth: 6,
              dataMap: dataMap,
              chartType: ChartType.ring,
              chartLegendSpacing: 10,
              chartRadius: MediaQuery.of(context).size.width / 3.0,
              initialAngleInDegree: 20,
              centerText: "total assets\n" + " \$1000 ",
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.left,
                showLegends: true,
                legendTextStyle: GlobalStyle.textH2BWhite,
              ),
              chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: false,
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 0,
                  chartValueStyle: GlobalStyle.textH0BWhite),
            )),
      );

      return Text('OOPS!');
    });
  }
}
