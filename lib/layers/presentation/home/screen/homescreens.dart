import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tmsadmin/layers/presentation/client/screens/clientsScreens.dart';
import 'package:tmsadmin/layers/presentation/dashbord/screens/dashbordScreeens.dart';
import 'package:tmsadmin/layers/presentation/home/screen/widgets/menuwidget.dart';
import 'package:tmsadmin/layers/presentation/livraison/screens/livraisonscreen.dart';
import 'package:tmsadmin/layers/presentation/livreur/screens/livreurscreen.dart';

class HomeScreen extends StatefulWidget {
  static String path = "Home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 3;
  void update(int v) {
    setState(() {
      index = v - 1;
    });
  }

  List widgets = [
    DashboardScreens(),
    ClientSreen(),
    LivreurScreen(),
    LivraisonScreen()
  ];
  var appbar = AppBar(
    elevation: 0,
    leading: InkWell(
      child: const Icon(Icons.menu),
      onTap: () {},
    ),
    backgroundColor: Colors.redAccent,
    title: const Text(
      "TMS",
      style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              appbar.preferredSize.height,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              MenuWidget(
                index: index,
                update: (index) => update(index),
              ),
              widgets[index]
            ],
          ),
        ),
      ),
    );
  }
}
