// To parse this JSON data, do
//
//     final reto = retoFromJson(jsonString);

import 'dart:convert';

class Reto {
  Reto({
    required this.completado,
    required this.nombre,
    required this.fecha,
  });

  bool completado;
  String nombre;
  String fecha;

  factory Reto.fromJson(String str) => Reto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reto.fromMap(Map<String, dynamic> json) => Reto(
        completado: json["completado"],
        nombre: json["nombre"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toMap() => {
        "completado": completado,
        "nombre": nombre,
        "fecha": fecha,
      };
}
