import 'package:flutter/material.dart';

class StaticElementWidget extends StatelessWidget {
  String title;
  Icon icon;
  int static;
  Color color;

  StaticElementWidget(
      {required this.icon,
      required this.static,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    double weight = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, size) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          width: weight * 0.22,
          height: size.maxHeight * 0.75,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: 20,
            height: size.maxHeight * 0.75,
            child: Column(
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      icon,
                      Text(
                        static.toString(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  fit: FlexFit.tight,
                  flex: 3,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.white, fontFamily: "opensans"),
                      )
                    ],
                  ),
                  fit: FlexFit.tight,
                  flex: 1,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
