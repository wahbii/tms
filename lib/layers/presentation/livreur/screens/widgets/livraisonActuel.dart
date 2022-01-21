import 'package:flutter/material.dart';

class LivraisonActuel extends StatefulWidget {
  const LivraisonActuel({Key? key}) : super(key: key);

  @override
  _LivraisonActuelState createState() => _LivraisonActuelState();
}

class _LivraisonActuelState extends State<LivraisonActuel> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Container(
          height: size.maxHeight,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                height: size.maxHeight * 0.9,
                width: size.maxWidth * 0.45,
                child: InputDecorator(
                  expands: true,
                  decoration: InputDecoration(
                    labelText: 'Livraison details :',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: _buildDetails("12-01-2022", "15-01-2022", 20, 10,
                      "Rabat", "Casablanca"),
                )),
            Container(
                height: size.maxHeight * 0.9,
                width: size.maxWidth * 0.45,
                child: InputDecorator(
                  expands: true,
                  decoration: InputDecoration(
                    labelText: 'Colis :',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(""),
                ))
          ]));
    });
  }

  _buildDetails(String date_dep, String date_Fin, int colis, int reste,
      String ville_depart, String ville_arriv) {
    return Row(
      children: [
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  elevation: 10,
                  child: LayoutBuilder(
                    builder: (context, size) {
                      return Container(
                        width: size.maxWidth * 0.9,
                        height: size.maxWidth * 0.55,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.blue[200],
                                    child: Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                    )),
                                Text(
                                  " " + ville_depart,
                                  style: TextStyle(
                                      fontFamily: "opensans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 20,
                                  color: Colors.blue[200],
                                  width: 2,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.blue[200],
                                    child: Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                    )),
                                Text(
                                  " " + ville_arriv,
                                  style: TextStyle(
                                      fontFamily: "opensans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Card(
                  elevation: 10,
                  child: LayoutBuilder(
                    builder: (context, size) {
                      return Container(
                        width: size.maxWidth * 0.9,
                        height: size.maxWidth * 0.55,
                      );
                    },
                  ),
                )
              ],
            )),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  elevation: 10,
                  child: LayoutBuilder(
                    builder: (context, size) {
                      return Container(
                        width: size.maxWidth * 0.9,
                        height: size.maxWidth * 0.55,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue[200],
                                  child: Text(
                                    colis.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  " Total des colis",
                                  style: TextStyle(
                                      fontFamily: "opensans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 20,
                                  color: Colors.blue[200],
                                  width: 2,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue[200],
                                  child: Text(
                                    reste.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  " Reste des colis ",
                                  style: TextStyle(
                                      fontFamily: "opensans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Card(
                  elevation: 10,
                  child: LayoutBuilder(
                    builder: (context, size) {
                      return Container(
                        width: size.maxWidth * 0.9,
                        height: size.maxWidth * 0.55,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.blue[200],
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                    )),
                                Text(
                                  " " + "Lundi," + date_dep,
                                  style: TextStyle(
                                      fontFamily: "opensans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 20,
                                  color: Colors.blue[200],
                                  width: 2,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.blue[200],
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                    )),
                                Text(
                                  " " + "Mar ," + date_Fin,
                                  style: TextStyle(
                                      fontFamily: "opensans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
      ],
    );
  }
}
