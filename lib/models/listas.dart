import 'package:my_gym_bro/models/models.dart';

class Listas {
  Listas();

  //creamos unas listas vacias
  List<Ejercicio> ejerciciosList = [];

  List<Ejercicio> ejerciciosRutinaList = [];

  List<String> musculoList = [];

  List<PR> prList = [];

  List<Rutina> rutinasList = [
    Rutina('Rutina prueba', 'detallitos', [
      EjercicioRutina(
          name: 'name',
          tip: 'tip',
          muscle: ['muscle'],
          url: 'url',
          numRepes: 9,
          volumenCarga: 8),
      EjercicioRutina(
          name: 'name',
          tip: 'tip',
          muscle: ['muscle'],
          url: 'url',
          numRepes: 9,
          volumenCarga: 8),
      EjercicioRutina(
          name: 'name',
          tip: 'tip',
          muscle: ['muscle'],
          url: 'url',
          numRepes: 9,
          volumenCarga: 8),
    ])
  ];

  List<Rutina> getRutinasList() {
    print('entra a get list $rutinasList');
    return rutinasList;
  }

  setRutinasList(List<Rutina> rutinasList) => this.rutinasList = rutinasList;

  void addRutinaList(Rutina rutina) {
    rutinasList.add(rutina);
    print('rutina añadida, total: $rutinasList');
  }

  get getPrList => prList;

  setPrList(List<PR> prList) => this.prList = prList;

  void addPrList(PR pr) {
    prList.add(pr);
  }

  get getMusculoList => musculoList;

  setMusculoList(musculoList) => this.musculoList = musculoList;

  void addMusculoList(String musculo) {
    musculoList.add(musculo);
  }

  List<Ejercicio> getListEjercicio() {
    return ejerciciosList;
  }

  setEjerciosList(List<Ejercicio> list) {
    ejerciciosList = list;
  }

  void addEjercicioList(Ejercicio ejercicio) {
    ejerciciosList.add(ejercicio);
  }

  get getListEjercicioRutina {
    return ejerciciosRutinaList;
  }

  setEjerciosRutinaList(List<Ejercicio> list) {
    ejerciciosRutinaList = list;
  }

  void addEjercicioRutinaList(Ejercicio ejercicio) {
    ejerciciosRutinaList.add(ejercicio);
  }

  void removeEjercicioRutinaList(Ejercicio ejercicio) {
    ejerciciosRutinaList.remove(ejercicio);
  }
}
