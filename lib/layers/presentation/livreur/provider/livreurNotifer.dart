import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:tmsadmin/layers/domaine/entities/livreur.dart';
import 'package:http/http.dart' as http;

class LivreurNotifier extends ChangeNotifier {
  List<Livreur> livreurs = [];
  List<Livreur> data = [];
  static const String URL = "http://localhost:8080/admin/livreur/";

  Future<void> getLivreurs() async {
    http.get(Uri.parse(URL)).then((value) {
      livreurs = [];
      data = [];
      for (Map<String, dynamic> elm in json.decode(value.body)) {
        Livreur client = Livreur(
          id: elm["id"],
          username: elm["username"].toString(),
          name: elm["name"].toString(),
          password: elm["password"].toString(),
          email: elm["email"].toString(),
          image: elm["image"].toString(),
          phone: elm["phone"].toString(),
        );

        livreurs.add(client);
        data.add(client);
        notifyListeners();
      }

      notifyListeners();

      print(livreurs.length);
    }).onError((error, stackTrace) {
      print(error.toString() + " : " + stackTrace.toString());
    });
  }

  Future<void> addClient(
      String imageFilePath,
      Uint8List imageBytes,
      String name,
      String username,
      String password,
      String email,
      String phone,
      bool payer) async {
    var uri = Uri.parse(URL);

    PickedFile imageFile = PickedFile(imageFilePath);
    var stream = http.ByteStream(imageFile.openRead());

    int length = imageBytes.length;
    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path + ".png"),
        contentType: MediaType('image', 'png'));

    request.files.add(multipartFile);
    request.fields["password"] = password;
    request.fields["username"] = username;
    request.fields["email"] = email;
    request.fields["phone"] = phone;
    request.fields["name"] = name;

    var response = request.send();
    response.then((value) {
      getLivreurs();
      value.stream.bytesToString().then((v) => print(v));
    }).catchError((err) => print(err));
  }

  Future<void> update(int id, String name, String username, String password,
      String email, String phone, bool payer) async {
    var request = http.MultipartRequest("POST", Uri.parse(URL + "update"));

    request.fields["password"] = password;
    request.fields["username"] = username;
    request.fields["email"] = email;

    request.fields["phone"] = phone;
    request.fields["name"] = name;
    request.fields["id"] = id.toString();
    var response = request.send();
    response.then((value) {
      getLivreurs();
      value.stream.bytesToString().then((v) => print(v));
    }).catchError((err) => print(err));
  }

  Future<void> remove(int id) async {
    http.delete(Uri.parse(URL + id.toString())).then((value) {
      getLivreurs();
      print(value);
    });
  }
}
