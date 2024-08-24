import 'dart:convert';

class Amigo {
  Amigo(this.nombre, this.fecha);

  String nombre;
  String fecha;

  factory Amigo.fromJson(String str) => Amigo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Amigo.fromMap(Map<String, dynamic> json) {
    return Amigo(
      json["nombre"] ?? '',
      json["fecha"] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "fecha": fecha,
      };
}

class SolicitudAmistad{
  SolicitudAmistad(this.de, this.para, this.estado);

  String de;
  String para;
  String estado;

  factory SolicitudAmistad.fromJson(String str) => SolicitudAmistad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SolicitudAmistad.fromMap(Map<String, dynamic> json) {
    return SolicitudAmistad(
      json["de"] ?? '',
      json["para"] ?? '',
      json["estado"] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        "de": de,
        "para": para,
        "estado": estado,
      };
}