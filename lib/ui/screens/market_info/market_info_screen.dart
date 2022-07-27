import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

class MarketInfoScreen extends StatelessWidget {
  MarketInfoScreen({Key? key}) : super(key: key);
  final Map<String, double> _fakeDataMap = {
    "facebook.com": 203552,
    "ingatlan.com": 145567,
    "koltozzbe.hu": 105146,
    "jofogas.hu": 98387,
    "ingatlanbazar.hu": 89194,
    "otthonterkep.hu": 70400,
    "ingatlantajolo.hu": 63136,
    "Egyéb oldalak": 221682,
  };
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          BlocProvider.of<NavigationBloc>(context).add(NavigationEventPop());
          return Future(() => true);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Piacinfó"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hirdetések száma:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                PieChart(
                    chartLegendSpacing: 20,
                    initialAngleInDegree: 270,
                    chartValuesOptions: const ChartValuesOptions(
                        decimalPlaces: 0, showChartValueBackground: false),
                    legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.bottom,
                        showLegendsInRow: true),
                    dataMap: _fakeDataMap)
              ],
            ),
          ),
        ));
  }
}
