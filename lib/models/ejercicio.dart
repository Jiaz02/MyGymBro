class Ejercicio {
  Ejercicio({
    required this.name,
    required this.tip,
    required this.muscle,
    required this.url,
  });

  final String name;
  final String tip;
  final List<String> muscle;
  final String url;
  
  get getName => name;

  get getTip => tip;

  get getMuscle => muscle;

  get getUrl => url;
}
