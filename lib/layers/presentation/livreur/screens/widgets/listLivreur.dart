import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmsadmin/layers/domaine/entities/livreur.dart';
import 'package:tmsadmin/layers/presentation/livreur/provider/livreurNotifer.dart';
import 'package:tmsadmin/layers/presentation/livreur/screens/widgets/livreuritems.dart';

class ListLiveur extends StatefulWidget {
  const ListLiveur({Key? key}) : super(key: key);

  @override
  _ListLiveurState createState() => _ListLiveurState();
}

class _ListLiveurState extends State<ListLiveur> {
  @override
  void initState() {
    super.initState();
    Provider.of<LivreurNotifier>(context, listen: false).getLivreurs();
  }

  bool formvalid = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<Livreur> livreurs = Provider.of<LivreurNotifier>(context).livreurs;
    double widght = MediaQuery.of(context).size.width * 0.8;
    return LayoutBuilder(builder: (context, size) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        height: size.maxHeight,
        width: widght * 0.32,
        child: InputDecorator(
          expands: true,
          decoration: InputDecoration(
            labelText: 'Liste Livreur',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return LivreurItems(
                  id: livreurs[index].id,
                  name: livreurs[index].name,
                  password: livreurs[index].password,
                  email: livreurs[index].email,
                  image: livreurs[index].image,
                  phone: livreurs[index].phone,
                  username: livreurs[index].username);
            },
            itemCount: livreurs.length,
          ),
        ),
      );
    });
  }
}
