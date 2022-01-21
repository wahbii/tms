import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:tmsadmin/layers/domaine/entities/client.dart';
import 'package:http/http.dart' as http;

class ClientNotifier extends ChangeNotifier {
  //final GetListClient getListClient;

  // ClientNotifier({required this.getListClient});

  List<Client> clients = [];
  List<Client> data = [];
  static const String URL = "http://localhost:8080/admin/client/";

  Future<void> getClients() async {
    Map<String, String> headers = {};

    http.get(Uri.parse(URL)).then((value) {
      clients = [];
      data = [];
      for (Map<String, dynamic> elm in json.decode(value.body)) {
        Client client = Client(
            id: elm["id"],
            username: elm["username"].toString(),
            name: elm["name"].toString(),
            password: elm["password"].toString(),
            email: elm["email"].toString(),
            image: elm["image"].toString(),
            payer: elm["payer"],
            phone: elm["phone"].toString(),
            colis: elm["colis"] as List<dynamic>);

        clients.add(client);
        data.add(client);
        notifyListeners();
      }

      notifyListeners();

      print(clients.length);
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
    request.fields["payed"] = payer ? "1" : "0";
    request.fields["phone"] = phone;
    request.fields["name"] = name;

    var response = request.send();
    response.then((value) {
      getClients();
      value.stream.bytesToString().then((v) => print(v));
    }).catchError((err) => print(err));
  }

  Future<void> update(int id, String name, String username, String password,
      String email, String phone, bool payer) async {
    var request = http.MultipartRequest("POST", Uri.parse(URL + "update"));

    request.fields["password"] = password;
    request.fields["username"] = username;
    request.fields["email"] = email;
    request.fields["payed"] = payer ? "1" : "0";
    request.fields["phone"] = phone;
    request.fields["name"] = name;
    request.fields["id"] = id.toString();
    var response = request.send();
    response.then((value) {
      getClients();
      value.stream.bytesToString().then((v) => print(v));
    }).catchError((err) => print(err));
  }

  Future<void> remove(int id) async {
    http.delete(Uri.parse(URL + id.toString())).then((value) {
      getClients();
      print(value);
    });
  }

  void filterBy(String elm) {
    switch (elm) {
      case "All":
        {
          clients = data;

          break;
        }
      case "Not Payed":
        {
          clients = [];
          for (Client elm in data) {
            if (!elm.payer) {
              clients.add(elm);
            }
          }

          notifyListeners();

          break;
        }
      case "Payed":
        {
          clients = [];
          for (Client elm in data) {
            if (elm.payer) {
              clients.add(elm);
            }
          }
          notifyListeners();

          break;
        }
    }
  }
}
