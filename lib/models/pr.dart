import 'dart:convert';

class Pr {
  Pr({
    required this.nameEjercicio,
    required this.peso,
  });

  String nameEjercicio;
  int peso;

  factory Pr.fromJson(String str) => Pr.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pr.fromMap(Map<String, dynamic> json) => Pr(
        nameEjercicio: json["nameEjercicio"],
        peso: json["peso"],
      );

  Map<String, dynamic> toMap() => {
        "nameEjercicio": nameEjercicio,
        "peso": peso,
      };
}
