import 'package:my_gym_bro/models/ejercicio.dart';

class Listas {
    Listas();

    //creamos una lista vacia
    List<Ejercicio> ejerciciosList= List.empty();

    List<Ejercicio> ejerciciosRutinaList= List.empty();


    get getListEjercicio{
      return ejerciciosList;
    }

    set setEjerciosList(List<Ejercicio> list){
      ejerciciosList=list;
    }

    void addEjercicioList(Ejercicio ejercicio){
      ejerciciosList.add(ejercicio);
    }


    get getListEjercicioRutina{
      return ejerciciosRutinaList;
    }

    set setEjerciosRutinaList(List<Ejercicio> list){
      ejerciciosRutinaList=list;
    }

    void addEjercicioRutinaList(Ejercicio ejercicio){
      ejerciciosRutinaList.add(ejercicio);
    }

    void removeEjercicioRutinaList(Ejercicio ejercicio){
      ejerciciosRutinaList.remove(ejercicio);
    }
}