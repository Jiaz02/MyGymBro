import 'dart:convert';

import 'package:my_gym_bro/models/models.dart';

///Clase que contiene las rutinas y sus distintas sub clases
class Rutina {
  Rutina(this.name, this.note, this.listEjerciciosRutina);

  String name;
  String note;
  List<EjercicioRutina>? listEjerciciosRutina = [];
  String? id;
  String? idUser;

  set setName(String name) => this.name = name;

  get getName => name;

  get getNote => note;

  set setNote(note) => note = note;

  get getListEjerciciosRutina => listEjerciciosRutina;

  set setListEjerciciosRutina(listEjerciciosRutina) =>
      this.listEjerciciosRutina = listEjerciciosRutina;

  factory Rutina.fromJson(String str) => Rutina.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  
  factory Rutina.fromMap(Map<String, dynamic> json) => Rutina(
        json["name"] ?? '',
        json["note"] ?? '',
        List<EjercicioRutina>.from(json["listEjerciciosRutina"]
                ?.map((x) => EjercicioRutina.fromMap(x)) ??
            []),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "note": note,
        "listEjerciciosRutina": List<dynamic>.from(
            listEjerciciosRutina?.map((x) => x.toMap()) ?? [])
      };
  @override
  String toString() {
    // TODO: implement toString
    return (name + ' ' + note + listEjerciciosRutina.toString());
  }
}
