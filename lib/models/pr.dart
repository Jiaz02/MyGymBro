import 'dart:convert';

///Clase que lee los pr de la base de datos
class Pr {
  Pr(
    this.nameEjercicio,
    this.peso,
    this.idUser
  );

  String nameEjercicio;
  double peso;
  String? id;
  String? idUser;

  factory Pr.fromJson(String str) => Pr.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pr.fromMap(Map<String, dynamic> json) {
    return Pr(
      json["nameEjercicio"] ?? '',
      json["peso"].toDouble() ?? 0.0,
      json["user"]?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        "nameEjercicio": nameEjercicio,
        "peso": peso,
        "user": idUser,
      };
}
