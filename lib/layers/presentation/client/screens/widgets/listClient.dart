import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmsadmin/layers/domaine/entities/client.dart';
import 'package:tmsadmin/layers/presentation/client/provider/clientprovider.dart';
import 'package:tmsadmin/layers/presentation/client/screens/widgets/cardClient.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListClient extends StatefulWidget {
  const ListClient({Key? key}) : super(key: key);

  @override
  _ListClientState createState() => _ListClientState();
}

class _ListClientState extends State<ListClient> {
  int selectedIndex = 0;
  String dropdownvalue = 'All';

  var items = [
    'All',
    'Payed',
    'Not Payed',
  ];
  List<Client> clients = [];
  @override
  void initState() {
    super.initState();
    Provider.of<ClientNotifier>(context, listen: false).getClients();
  }

  @override
  Widget build(BuildContext context) {
    clients = Provider.of<ClientNotifier>(context).clients;

    return LayoutBuilder(builder: (context, size) {
      return Container(
        width: size.maxWidth,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: size.maxHeight,
        /*decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),*/
        child: Container(
          child: Column(
            children: [
              Container(
                height: 45,
                width: size.maxWidth,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                /* decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),*/
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Select Client : ",
                      style: TextStyle(
                          fontFamily: "opensans",
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 2),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: DropdownButton(
                        underline: SizedBox(),
                        borderRadius: BorderRadius.circular(10),

                        value: dropdownvalue,

                        icon: const Icon(Icons.keyboard_arrow_down),

                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,
                                style: TextStyle(
                                    fontFamily: "opensans",
                                    fontSize: 16,
                                    color: Colors.grey)),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            selectedIndex = 0;

                            Provider.of<ClientNotifier>(context, listen: false)
                                .filterBy(newValue);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: clients.length == 0
                      ? Center(
                          child: SpinKitPouringHourGlass(color: Colors.blue))
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Card(
                                  elevation: selectedIndex != index ? 0 : 20,
                                  child: CardClient(
                                    id: clients[index].id,
                                    username: clients[index].username,
                                    password: clients[index].password,
                                    name: clients[index].name,
                                    mail: clients[index].email,
                                    imageUrl: clients[index].image,
                                    numberColis: clients[index].colis.length,
                                    phone: clients[index].phone,
                                    payed: clients[index].payer,
                                  ),
                                ));
                          },
                          itemCount: clients.length,
                        ))
            ],
          ),
        ),
      );
    });
  }
}
