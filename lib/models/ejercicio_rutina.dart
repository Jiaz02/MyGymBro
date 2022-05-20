class EjercicioRutina {
  EjercicioRutina({
    required this.name,
    required this.tip,
    required this.muscle,
    required this.url,
    required this.numRepes,
    required this.volumenCarga,
  });

  final String name;
  final String tip;
  final List<String> muscle;
  final String url;
  int numRepes;
  double volumenCarga;
  
  get getName => name;

  get getTip => tip;

  get getMuscle => muscle;

  get getUrl => url;

  get getNumRepes => numRepes;

  set setNumRepes(numRepes) => numRepes = numRepes;

  get getVolumenCarga => volumenCarga;

  set setVolumenCarga(volumenCarga) => volumenCarga = volumenCarga;
}
