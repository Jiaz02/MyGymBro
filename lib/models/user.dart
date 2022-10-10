import 'dart:convert';

import 'package:my_gym_bro/models/models.dart';

class User {
  User({
    required this.nombre,
    required this.email,
    required this.password,
    required this.rutinas,
    required this.pr,
    required this.retos,
  });

  String nombre;
  String email;
  String password;
  List<Rutina> rutinas;
  List<Pr> pr;
  List<Reto> retos;
  String? id;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        nombre: json["nombre"],
        email: json["email"],
        password: json["password"],
        rutinas:
            List<Rutina>.from(json["rutinas"].map((x) => Rutina.fromMap(x))),
        pr: List<Pr>.from(json["pr"].map((x) => Pr.fromMap(x))),
        retos: List<Reto>.from(json["retos"].map((x) => Reto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "email": email,
        "password": password,
        "rutinas": List<dynamic>.from(rutinas.map((x) => x.toMap())),
        "pr": List<dynamic>.from(pr.map((x) => x.toMap())),
        "retos": List<dynamic>.from(retos.map((x) => x.toMap())),
      };
}
