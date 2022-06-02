import 'package:my_gym_bro/models/models.dart';

class EjercicioRutina {
  EjercicioRutina({
    required this.name,
    required this.tip,
    required this.muscle,
    required this.url,
    required this.listSeries,
  });

  String name;
  String tip;
  List<String> muscle;
  String url;
  List<RowRepKg> listSeries;

  get getListSeries => this.listSeries;

  set setListSeries(listSeries) => this.listSeries = listSeries;

  get getName => name;

  get getTip => tip;

  get getMuscle => muscle;

  get getUrl => url;

  @override
  String toString() {
    return name +
        ' ' +
        tip +
        ' ' +
        muscle.toString() +
        ' ' +
        url +
        ' ' +
        listSeries.toString();
  }
}
