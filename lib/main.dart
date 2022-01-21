import 'package:flutter/material.dart';
import 'package:tmsadmin/layers/presentation/client/provider/clientprovider.dart';
import 'package:tmsadmin/layers/presentation/home/screen/homescreens.dart';
import 'package:provider/provider.dart';
import 'package:tmsadmin/layers/presentation/livreur/provider/livreurNotifer.dart';

void main() {
  runApp(Principalscreen());
}

class Principalscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClientNotifier>(create: (_) => ClientNotifier()),
        ChangeNotifierProvider<LivreurNotifier>(
            create: (_) => LivreurNotifier())
      ],
      child: MaterialApp(
        initialRoute: HomeScreen.path,
        routes: {
          HomeScreen.path: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
