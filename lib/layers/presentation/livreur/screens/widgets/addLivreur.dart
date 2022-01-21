import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tmsadmin/layers/presentation/livreur/provider/livreurNotifer.dart';

class AddLiveur extends StatefulWidget {
  const AddLiveur({Key? key}) : super(key: key);

  @override
  _AddLiveurState createState() => _AddLiveurState();
}

class _AddLiveurState extends State<AddLiveur> {
  bool formvalid = true;

  final _formKey = GlobalKey<FormState>();
  bool valideform = true;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController imagepath = TextEditingController();

  bool payed = false;
  String imageFilePath = "";
  Uint8List imageBytes = Uint8List(10);
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
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
            labelText: 'Ajouter Livreur',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: valideform
                      ? const EdgeInsets.all(10)
                      : const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: const Text(
                    "Add Client",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "opensans",
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                        controller: username,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return "username must have more then 6 characters";
                          }
                          return null;
                        },
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Username",
                          prefixIconColor: Colors.grey,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ))),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return "Password must have more then 6 characters";
                          }
                          return null;
                        },
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          prefixIconColor: Colors.grey,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ))),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: TextFormField(
                                controller: name,
                                validator: (value) {
                                  if (value == null || value.length < 6) {
                                    return "name must have more then 6 characters";
                                  }
                                  return null;
                                },
                                cursorColor: Colors.white,
                                decoration: const InputDecoration(
                                  hintText: "Name",
                                  prefixIconColor: Colors.grey,
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: TextFormField(
                                controller: phone,
                                validator: (value) {
                                  if (value == null || value.length < 6) {
                                    return "phone must have more then 6 characters";
                                  }
                                  return null;
                                },
                                cursorColor: Colors.white,
                                decoration: const InputDecoration(
                                  hintText: "phone",
                                  prefixIconColor: Colors.grey,
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || !value.contains("@")) {
                            return "enter valide email";
                          }
                          return null;
                        },
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIconColor: Colors.grey,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ))),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      ImagePicker.platform
                                          .pickImage(
                                              source: ImageSource.gallery)
                                          .then((value) {
                                        imageFilePath = value!.path;

                                        value.readAsBytes.call().then((value) {
                                          imageBytes = value;
                                        });
                                        setState(() {
                                          imagepath.text = "image added";
                                        });
                                      });
                                    },
                                    child: Icon(Icons.camera),
                                  ),
                                ),
                                const Text(
                                  "Load Profile Image",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                )
                              ],
                            )),
                        fit: FlexFit.tight,
                        flex: 2,
                      )
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          valideform = true;
                          Provider.of<LivreurNotifier>(context, listen: false)
                              .addClient(
                                  imageFilePath,
                                  imageBytes,
                                  name.text,
                                  username.text,
                                  password.text,
                                  email.text,
                                  phone.text,
                                  true);
                        });
                      } else {
                        setState(() {
                          valideform = false;
                        });
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text("save",
                          style: TextStyle(
                              fontFamily: "opensans",
                              fontSize: 16,
                              color: Colors.grey)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
