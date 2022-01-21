import 'package:flutter/material.dart';
import 'package:tmsadmin/layers/presentation/livreur/screens/widgets/addLivreur.dart';
import 'package:tmsadmin/layers/presentation/livreur/screens/widgets/listLivreur.dart';
import 'package:tmsadmin/layers/presentation/livreur/screens/widgets/livraisonActuel.dart';
import 'package:tmsadmin/layers/presentation/livreur/screens/widgets/positionLivreur.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LivreurScreen extends StatefulWidget {
  const LivreurScreen({Key? key}) : super(key: key);

  @override
  _LivreurScreenState createState() => _LivreurScreenState();
}

class _LivreurScreenState extends State<LivreurScreen> {
  final List<PopulationData> data = [
    PopulationData(
        year: "m1",
        population: 8,
        barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)),
    PopulationData(
        year: "m2",
        population: 10,
        barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)),
    PopulationData(
        year: "m3",
        population: 10,
        barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)),
    PopulationData(
        year: "m4",
        population: 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)),
    PopulationData(
        year: "m6",
        population: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
    PopulationData(
        year: "m7",
        population: 14,
        barColor: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
    PopulationData(
        year: "m8",
        population: 20,
        barColor: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
    PopulationData(
        year: "m9",
        population: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
    PopulationData(
        year: "m10",
        population: 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    PopulationData(
        year: "m11",
        population: 24,
        barColor: charts.ColorUtil.fromDartColor(Colors.purple)),
    PopulationData(
        year: "m12",
        population: 20,
        barColor: charts.ColorUtil.fromDartColor(Colors.purple)),
  ];
  _getSeriesData() {
    List<charts.Series<PopulationData, String>> series = [
      charts.Series(
          id: "Population",
          data: data,
          domainFn: (PopulationData series, _) => series.year.toString(),
          measureFn: (PopulationData series, _) => series.population,
          colorFn: (PopulationData series, _) => series.barColor)
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [AddLiveur(), ListLiveur(), PositionLiveur()],
            ),
            fit: FlexFit.tight,
            flex: 3,
          ),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: LivraisonActuel(),
                  flex: 2,
                  fit: FlexFit.tight,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Nombre de livraison pour les derniers mois",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: InputDecorator(
                                expands: true,
                                decoration: InputDecoration(
                                  labelText:
                                      "Nombre de livraison pour les derniers mois",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: charts.BarChart(
                                  _getSeriesData(),
                                  animate: true,
                                  domainAxis: charts.OrdinalAxisSpec(
                                      renderSpec: charts.SmallTickRendererSpec(
                                          labelRotation: 60)),
                                ))),
                      )
                    ],
                  ),
                ),
              ],
            ),
            fit: FlexFit.tight,
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class PopulationData {
  String year;
  int population;
  charts.Color barColor;
  PopulationData(
      {required this.year, required this.population, required this.barColor});
}
