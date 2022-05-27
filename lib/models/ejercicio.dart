import 'dart:convert';

Ejercicio ejercicioFromJson(String str) => Ejercicio.fromJson(json.decode(str));

String ejercicioToJson(Ejercicio data) => json.encode(data.toJson());

class Ejercicio {
    Ejercicio({
        required this.ejercicio,
    });

    List<EjercicioElement> ejercicio;

    factory Ejercicio.fromJson(Map<String, dynamic> json) => Ejercicio(
        ejercicio: List<EjercicioElement>.from(json["ejercicio"].map((x) => EjercicioElement.fromJson(x))),
    );

  String get name => this.name;

  

  

    Map<String, dynamic> toJson() => {
        "ejercicio": List<dynamic>.from(ejercicio.map((x) => x.toJson())),
    };
}

class EjercicioElement {
    EjercicioElement({
        required this.name,
        required this.tip,
        required this.muscle,
        required this.url,
    });

    String name;
    String tip;
    List<String> muscle;
    String url;

 String get getName => this.name;


  get getTip => this.tip;


  get getMuscle => this.muscle;


  get getUrl => this.url;


    factory EjercicioElement.fromJson(Map<String, dynamic> json) => EjercicioElement(
        name: json["name"],
        tip: json["tip"],
        muscle: List<String>.from(json["muscle"].map((x) => x)),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "tip": tip,
        "muscle": List<dynamic>.from(muscle.map((x) => x)),
        "url": url,
    };
}
