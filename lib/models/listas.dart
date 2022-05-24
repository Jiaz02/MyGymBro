import 'package:flutter/material.dart';
import 'package:my_gym_bro/models/models.dart';

class Listas {
    
  Listas();

  //creamos unas listas vacias
  List<Ejercicio> ejerciciosList = List.empty();

  List<Ejercicio> ejerciciosRutinaList = List.empty();

  List<Rutina> rutinasList = List.empty();

  List<String> musculoList = List.empty();

  List<PR> prList = List.empty();

  get getPrList => prList;

  set setPrList(List<PR> prList) => this.prList = prList;

  void addPrList(PR pr) {
    prList.add(pr);
  }

  get getRutinasList => rutinasList;

  set setRutinasList(List<Rutina> rutinasList) =>
      this.rutinasList = rutinasList;

  void addRutinaList(Rutina rutina) {
    print('aqui llega');
    print(rutina);
    rutinasList.add(rutina);
  }

  get getMusculoList => musculoList;

  set setMusculoList(musculoList) => this.musculoList = musculoList;

  void addMusculoList(String musculo) {
    musculoList.add(musculo);
  }

  get getListEjercicio {
    return ejerciciosList;
  }

  set setEjerciosList(List<Ejercicio> list) {
    ejerciciosList = list;
  }

  void addEjercicioList(Ejercicio ejercicio) {
    ejerciciosList.add(ejercicio);
  }

  get getListEjercicioRutina {
    return ejerciciosRutinaList;
  }

  set setEjerciosRutinaList(List<Ejercicio> list) {
    ejerciciosRutinaList = list;
  }

  void addEjercicioRutinaList(Ejercicio ejercicio) {
    ejerciciosRutinaList.add(ejercicio);
  }

  void removeEjercicioRutinaList(Ejercicio ejercicio) {
    ejerciciosRutinaList.remove(ejercicio);
  }


}


