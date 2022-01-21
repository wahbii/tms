import 'package:equatable/equatable.dart';

class Livreur extends Equatable {
  final int id;
  final String username;
  final String password;
  final String name;
  final String phone;
  final String image;
  final String email;
  Livreur(
      {required this.id,
      required this.username,
      required this.password,
      required this.name,
      required this.email,
      required this.image,
      required this.phone});

  factory Livreur.fromJson(Map<String, dynamic> json) {
    return Livreur(
      id: json["id"],
      username: json["username"],
      password: json["password"],
      email: json["email"],
      image: json["image"],
      name: json["name"],
      phone: json["phone"],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, username];
}
