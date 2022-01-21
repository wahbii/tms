import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmsadmin/layers/presentation/client/provider/clientprovider.dart';

class CardClient extends StatefulWidget {
  String mail;
  String name;
  String imageUrl;
  int numberColis;
  bool payed;
  String phone;
  String password;
  String username;
  int id;

  CardClient({
    Key? key,
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.mail,
    required this.imageUrl,
    required this.numberColis,
    required this.phone,
    required this.payed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardClientState();
  }
}

class _CardClientState extends State<CardClient> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Container(
        margin: const EdgeInsets.all(5),
        width: size.maxWidth * 0.9,
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.payed ? Colors.green : Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: widget.imageUrl == "null"
                  ? Image.asset("assets/images/image_not_found.png")
                  : Image.network(widget.imageUrl
                      .replaceFirst("localhost", "192.168.1.106")),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("Name : ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "opensans",
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.black)),
                        Text(widget.name,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontFamily: "opensans",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Email : ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "opensans",
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.black)),
                        Text(widget.mail,
                            style: const TextStyle(
                                fontFamily: "opensans",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Phone : ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "opensans",
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.black)),
                        Text(widget.phone,
                            style: const TextStyle(
                                fontFamily: "opensans",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
              flex: 2,
              fit: FlexFit.tight,
            ),
            Flexible(
              child: Stack(
                children: [
                  Positioned(
                      top: 5,
                      left: 40,
                      child: Container(
                        height: 30,
                        width: 50,
                        alignment: Alignment.center,
                        child: Text(widget.numberColis.toString(),
                            style: const TextStyle(
                                fontFamily: "opensans",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  Positioned(
                      bottom: 5,
                      right: 35,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
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
                                            Provider.of<ClientNotifier>(context,
                                                    listen: false)
                                                .remove(widget.id)
                                                .then((value) =>
                                                    Navigator.pop(context));
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
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text("R",
                              style: TextStyle(
                                  fontFamily: "opensans",
                                  fontSize: 14,
                                  color: Colors.white)),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15)),
                          height: 30,
                          width: 30,
                        ),
                      )),
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return Dialog(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomRight:
                                                  Radius.circular(20))),
                                      width: 500,
                                      height: 400,
                                      child: _buildForm(context),
                                    ),
                                  );
                                });
                              });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text("U",
                              style: TextStyle(
                                  fontFamily: "opensans",
                                  fontSize: 16,
                                  color: Colors.white)),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(15)),
                          height: 30,
                          width: 30,
                        ),
                      ))
                ],
              ),
              fit: FlexFit.tight,
              flex: 1,
            )
          ],
        ),
      );
    });
  }

  _buildForm(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool valideform = true;
    TextEditingController name = TextEditingController(text: widget.name);
    TextEditingController password =
        TextEditingController(text: widget.password);
    TextEditingController email = TextEditingController(text: widget.mail);
    TextEditingController username =
        TextEditingController(text: widget.username);
    TextEditingController phone = TextEditingController(text: widget.phone);
    bool loading = false;
    bool payer = widget.payed;

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
                        value: payer,
                        onChanged: (v) {
                          setState(() {
                            print(payer);
                            payer = v!;
                          });
                        },
                      )
                    ],
                  ),
                  flex: 1,
                  fit: FlexFit.tight,
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  Provider.of<ClientNotifier>(context, listen: false)
                      .update(widget.id, name.text, username.text,
                          password.text, email.text, phone.text, payer)
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
