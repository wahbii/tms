import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tmsadmin/layers/presentation/client/provider/clientprovider.dart';

class AddClient extends StatefulWidget {
  const AddClient({Key? key}) : super(key: key);

  @override
  _AddClientState createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
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
    return LayoutBuilder(builder: (context, size) {
      return Column(
        children: [
          Container(
            width: size.maxWidth,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: size.maxHeight * 0.8,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ))),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              const Text(
                                "payed :",
                                style: TextStyle(
                                    fontFamily: "opensans",
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                              Checkbox(
                                value: payed,
                                onChanged: (v) {
                                  setState(() {
                                    print(v);
                                    payed = v!;
                                    print(payed);
                                  });
                                },
                              )
                            ],
                          ),
                          flex: 1,
                          fit: FlexFit.tight,
                        ),
                        Flexible(
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                  onTap: () {
                                    ImagePicker.platform
                                        .pickImage(source: ImageSource.gallery)
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
                                  controller: imagepath,
                                  cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.camera),
                                    hintText: "Load image",
                                    prefixIconColor: Colors.grey,
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ))),
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
                          });
                          Provider.of<ClientNotifier>(context, listen: false)
                              .addClient(
                                  imageFilePath,
                                  imageBytes,
                                  name.text,
                                  username.text,
                                  password.text,
                                  email.text,
                                  phone.text,
                                  payed)
                              .then((value) => print("done"));
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
          Container(
            width: size.maxWidth,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: size.maxHeight * 0.15,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
          )
        ],
      );
    });
  }
}
