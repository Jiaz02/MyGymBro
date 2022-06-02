import 'package:get/get.dart';
import 'package:my_gym_bro/models/models.dart';

class Listas extends GetxController {
  Listas();

  //creamos unas listas vacias
  List<EjercicioElement> ejerciciosList = [];

  List<EjercicioElement> ejerciciosRutinaList = [];

  List<String> musculoList = [];

  List<PR> prList = [];

  List<Rutina> rutinasList = [
    Rutina('Rutina prueba', 'Dormí mal', [
      EjercicioRutina(
        name: 'Press Banca con Barra',
        tip: 'Baja hasta rozar el pectoral. Abre más el agarre para que el triceps intervenga menos. Segun la inclinacion (15 a 30) o declinacion (-15 a -30) del banco se reclutan mas fibras superiores o inferiores respectivamente.',
        muscle: [
                "Pectoral",
                "Triceps",
                "Deltoides anterior"
            ],
        url: 'assets/pressbanca.gif',
        listSeries: [RowRepKg(repes: 4, kg: 4)],
      ),      
      EjercicioRutina(
        name: 'Press Banca con Barra',
        tip: 'Baja hasta rozar el pectoral. Abre más el agarre para que el triceps intervenga menos. Segun la inclinacion (15 a 30) o declinacion (-15 a -30) del banco se reclutan mas fibras superiores o inferiores respectivamente.',
        muscle: [
                "Pectoral",
                "Triceps",
                "Deltoides anterior"
            ],
        url: 'assets/pressbanca.gif',
        listSeries: [RowRepKg(repes: 4, kg: 4)],
      ),      
      EjercicioRutina(
        name: 'Press Banca con Barra',
        tip: 'Baja hasta rozar el pectoral. Abre más el agarre para que el triceps intervenga menos. Segun la inclinacion (15 a 30) o declinacion (-15 a -30) del banco se reclutan mas fibras superiores o inferiores respectivamente.',
        muscle: [
                "Pectoral",
                "Triceps",
                "Deltoides anterior"
            ],
        url: 'assets/pressbanca.gif',
        listSeries: [RowRepKg(repes: 4, kg: 4)],
      ),      
    ])
  ];

  List<Rutina> getRutinasList() {
    print('entra a get list $rutinasList');
    return rutinasList;
  }

  setRutinasList(List<Rutina> rutinasList) => this.rutinasList = rutinasList;

  void addRutinaList(Rutina rutina) {
    rutinasList.add(rutina);
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

  List<EjercicioElement> getListEjercicio() {
    return ejerciciosList;
  }

  setEjerciosList(List<EjercicioElement> list) {
    ejerciciosList = list;
  }

  void addEjercicioList(EjercicioElement ejercicio) {
    ejerciciosList.add(ejercicio);
  }

  get getListEjercicioRutina {
    return ejerciciosRutinaList;
  }

  setEjerciosRutinaList(List<EjercicioElement> list) {
    ejerciciosRutinaList = list;
  }

  void addEjercicioRutinaList(EjercicioElement ejercicio) {
    ejerciciosRutinaList.add(ejercicio);
  }

  void removeEjercicioRutinaList(EjercicioElement ejercicio) {
    ejerciciosRutinaList.remove(ejercicio);
  }

  // TODO: poner un future que lea la lista llamandolo en el main o en splash

}
