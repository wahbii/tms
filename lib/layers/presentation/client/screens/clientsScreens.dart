import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmsadmin/layers/domaine/entities/client.dart';
import 'package:tmsadmin/layers/presentation/client/provider/clientprovider.dart';
import 'package:tmsadmin/layers/presentation/client/screens/widgets/addClient.dart';
import 'package:tmsadmin/layers/presentation/client/screens/widgets/listClient.dart';
import 'package:tmsadmin/layers/presentation/client/screens/widgets/staticwigets.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ClientSreen extends StatefulWidget {
  const ClientSreen({Key? key}) : super(key: key);

  @override
  _ClientSreenState createState() => _ClientSreenState();
}

class _ClientSreenState extends State<ClientSreen> {
  int selectedelement = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ClientNotifier>(context, listen: false).getClients();
  }

  @override
  Widget build(BuildContext context) {
    List<Client> client = Provider.of<ClientNotifier>(context).clients;
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StaticElementWidget(
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Color(0xFF0E3311).withOpacity(0.5),
                        size: 55,
                      ),
                      static: client[selectedelement].colis.length,
                      title: "Total Du Colis ",
                      color: Colors.blue),
                  StaticElementWidget(
                      icon: Icon(Icons.alarm,
                          color: Color(0xFF0E3311).withOpacity(0.5), size: 55),
                      static: 0,
                      title: "Colis a livré ",
                      color: Colors.deepOrangeAccent),
                  StaticElementWidget(
                      icon: Icon(Icons.shop,
                          color: Color(0xFF0E3311).withOpacity(0.5), size: 55),
                      static: 0,
                      title: "Colis sur total ",
                      color: Colors.purple),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  const Flexible(
                      flex: 1, fit: FlexFit.tight, child: AddClient()),
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: ListClient(),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: LayoutBuilder(builder: (context, size) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
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
                                )),
                            margin: const EdgeInsets.only(
                                bottom: 5, right: 5, top: 5),
                            height: size.maxHeight * 0.45,
                            width: size.maxWidth,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5, right: 5),
                            height: size.maxHeight * 0.45,
                            width: size.maxWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                          )
                        ],
                      );
                    }),
                  )
                ],
              ),
            )
          ],
        ));
  }

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
}

class PopulationData {
  String year;
  int population;
  charts.Color barColor;
  PopulationData(
      {required this.year, required this.population, required this.barColor});
}
