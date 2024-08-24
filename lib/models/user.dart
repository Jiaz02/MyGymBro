import 'dart:convert';

import 'package:my_gym_bro/models/amigo.dart';
import 'package:my_gym_bro/models/models.dart';

class User {
  User({
    required this.nombre,
    required this.email,
    required this.rutinas,
    required this.pr,
    required this.retos,
    required this.peso,
    required this.altura,
    required this.edad,
    required this.amigos,
  });

  String nombre;
  String email;
  String peso;
  String altura;
  String edad;
  List<Rutina>? rutinas;
  List<Pr>? pr;
  List<Reto>? retos;
  String? id;
  List<Amigo>? amigos;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
  nombre: json["nombre"] ?? "",
  email: json["email"] ?? "",
  peso: json["peso"] ?? "",
  altura: json["altura"] ?? "",
  edad: json["edad"] ?? "",
  rutinas: json["rutinas"] != null && json["rutinas"] is Map
      ? (json["rutinas"] as Map<String, dynamic>).entries.map((entry) {
          return Rutina.fromMap(entry.value);
        }).toList()
      : [],
  pr: json["prs"] != null && json["prs"] is Map
      ? List<Pr>.from((json["prs"] as Map<String, dynamic>).entries.map((entry) => Pr.fromMap(entry.value))).toList()
      : [],
  retos: json["retos"] != null && json["retos"] is Map
      ? List<Reto>.from((json["retos"] as Map<String, dynamic>).entries.map((entry) => Reto.fromMap(entry.value))).toList()
      : [],
  amigos: json["amigos"] != null && json["amigos"] is Map
      ? List<Amigo>.from((json["amigos"] as Map<String, dynamic>).entries.map((entry) => Amigo.fromMap(entry.value))).toList()
      : [],
);
  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "email": email,
        "peso": peso,
        "altura": altura,
        "edad": edad,
        "rutinas": List<dynamic>.from(rutinas!.map((x) => x.toMap())),
        "pr": List<dynamic>.from(pr!.map((x) => x.toMap())),
        "retos": List<dynamic>.from(retos!.map((x) => x.toMap())),
        "amigos": List<dynamic>.from(amigos!.map((x) => x.toMap()))
      };
  
}
