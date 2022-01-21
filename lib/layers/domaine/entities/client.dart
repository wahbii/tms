import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final int id;
  final String username;
  final String password;
  final String name;
  final String phone;
  final String image;
  final String email;
  final bool payer;
  final List<dynamic> colis;

  Client(
      {required this.id,
      required this.username,
      required this.name,
      required this.password,
      required this.email,
      required this.image,
      required this.payer,
      required this.phone,
      required this.colis});
  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        image: json["image"],
        name: json["name"],
        phone: json["phone"],
        payer: json["payer"],
        colis: json["colis"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "username :$username password : $password";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, username];
}
