import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tmsadmin/layers/presentation/livreur/provider/livreurNotifer.dart';

class LivreurItems extends StatefulWidget {
  int id;
  String name;
  String username;
  String password;
  String email;
  String phone;
  String image;

  LivreurItems(
      {Key? key,
      required this.id,
      required this.name,
      required this.password,
      required this.email,
      required this.image,
      required this.phone,
      required this.username})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LivreurItemState();
  }
}

class _LivreurItemState extends State<LivreurItems> {
  String dropdownvalue = ' ';

  var items = [
    ' ',
    'Remove',
    'Update',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        decoration: BoxDecoration(
            color: Colors.blue[200],
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        width: size.maxWidth * 0.5,
        height: 120,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                left: -size.maxWidth * 0.1,
                bottom: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(size.maxWidth * 0.105),
                  ),
                  width: size.maxWidth * 0.2,
                  height: size.maxWidth * 0.2,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: ClipOval(
                      child: widget.image == "null"
                          ? Image.asset("assets/images/image_not_found.png")
                          : Image.network(widget.image),
                    ),
                  ),
                )),
            Positioned(
              left: size.maxWidth * 0.15,
              child: Container(
                height: 110,
                width: size.maxWidth * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        widget.name,
                        style: TextStyle(
                            fontFamily: "opensans",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.email,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "opensans",
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          widget.phone,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "opensans",
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      height: 2,
                      width: 50,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Icon(
                                Icons.pin_drop,
                                color: Colors.black,
                              ),
                              Text("Position",
                                  style: TextStyle(
                                    fontFamily: "opensans",
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ))
                            ],
                          ),
                          flex: 1,
                          fit: FlexFit.tight,
                        ),
                        Flexible(
                          child: Row(),
                          flex: 1,
                          fit: FlexFit.tight,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 0,
                right: 5,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red.withOpacity(0.9)),
                )),
            Positioned(
              bottom: 0,
              right: 5,
              child: DropdownButton(
                underline: SizedBox(),
                borderRadius: BorderRadius.circular(10),

                value: dropdownvalue,

                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),

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
                  switch (newValue) {
                    case "Remove":
                      {
                        _Remove(context);
                        break;
                      }
                    case "Update":
                      {
                        _Update(context);
                        break;
                      }
                  }
                },
              ), /* Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                )*/
            )
          ],
        ),
      );
    });
  }

  void _Update(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                width: 500,
                height: 400,
                child: _buildForm(context),
              ),
            );
          });
        });
  }

  void _Remove(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text("Are you sure ?",
                  style: TextStyle(
                      fontFamily: "opensans",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              actions: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      Provider.of<LivreurNotifier>(context, listen: false)
                          .remove(widget.id)
                          .then((value) => Navigator.pop(context));
                    },
                    child: Text("Remove",
                        style: TextStyle(
                            fontFamily: "opensans",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)))
              ],
            );
          });
        });
  }

  _buildForm(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool valideform = true;
    TextEditingController name = TextEditingController(text: widget.name);
    TextEditingController password =
        TextEditingController(text: widget.password);
    TextEditingController email = TextEditingController(text: widget.email);
    TextEditingController username =
        TextEditingController(text: widget.username);
    TextEditingController phone = TextEditingController(text: widget.phone);
    bool loading = false;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin:
                valideform ? const EdgeInsets.all(10) : const EdgeInsets.all(0),
            alignment: Alignment.center,
            child: const Text(
              "Update Client",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "opensans", fontSize: 20, color: Colors.grey),
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
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
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
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  Provider.of<LivreurNotifier>(context, listen: false)
                      .update(widget.id, name.text, username.text,
                          password.text, email.text, phone.text, true)
                      .then((value) {
                    setState(() {
                      loading = false;
                    });
                    Navigator.pop(context);
                  });
                } else {}
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                child: const Text("Update",
                    style: TextStyle(
                        fontFamily: "opensans",
                        fontSize: 16,
                        color: Colors.grey)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
