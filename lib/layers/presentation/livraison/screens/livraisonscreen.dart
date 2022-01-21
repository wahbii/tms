import 'package:flutter/material.dart';
import 'package:tmsadmin/layers/presentation/client/screens/widgets/staticwigets.dart';

class LivraisonScreen extends StatefulWidget {
  const LivraisonScreen({Key? key}) : super(key: key);

  @override
  _LivraisonScreenState createState() => _LivraisonScreenState();
}

class _LivraisonScreenState extends State<LivraisonScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ),
          Flexible(
            child: Container(),
            flex: 2,
            fit: FlexFit.tight,
          )
        ],
      ),
    );
    ;
  }
}
