import 'package:flutter/material.dart';

class DashboardScreens extends StatefulWidget {
  @override
  _DashboardScreensState createState() => _DashboardScreensState();
}

class _DashboardScreensState extends State<DashboardScreens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Center(
        child: Text("DashBord"),
      ),
    );
  }
}
