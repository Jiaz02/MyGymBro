import 'package:my_gym_bro/models/models.dart';

class Rutina {
  Rutina(this.name, this.note, this.listEjerciciosRutina);

  String name;
  String note;
  List<EjercicioRutina> listEjerciciosRutina = List.empty();

  set setName(String name) => this.name = name;

  get getName => name;

  get getNote => note;

  set setNote(note) => note = note;

  get getListEjerciciosRutina => listEjerciciosRutina;

  set setListEjerciciosRutina(listEjerciciosRutina) =>
      this.listEjerciciosRutina = listEjerciciosRutina;
}
