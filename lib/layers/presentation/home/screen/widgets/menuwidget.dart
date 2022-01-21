import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  int index;
  final void Function(int) update;
  MenuWidget({required this.index, required, required this.update});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  List elements = [
    {},
    {"icon": Icons.dashboard, "title": "Dashbord"},
    {"icon": Icons.cabin, "title": "Client"},
    {"icon": Icons.person, "title": "Livreur"},
    {"icon": Icons.motorcycle, "title": "Livraisons"},
    {"icon": Icons.car_rental, "title": "Véhicules"},
    {"icon": Icons.settings, "title": "Paramétres"},
    {"icon": Icons.add_alert, "title": "A Propos"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(color: Colors.black54),
      child: ListView.builder(
          itemCount: elements.length,
          itemBuilder: (BuildContext c, int elm) {
            return elm == 0
                ? LayoutBuilder(builder: (context, size) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                hintText: "Search",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                prefixIconColor: Colors.white,
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                      height: 100,
                      width: size.maxWidth,
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                    );
                  })
                : Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => setState(() {
                        widget.update(elm);
                      }),
                      child: ListTile(
                          leading: Icon(
                            elements[elm]["icon"],
                            color: Colors.white,
                          ),
                          title: Text(
                            elements[elm]["title"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )),
                    ),
                  );
          }),
    );
  }
}
