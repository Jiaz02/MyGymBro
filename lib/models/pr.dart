import 'dart:convert';

class Pr {
  Pr({
    required this.nameEjercicio,
    required this.peso,
  });

  String nameEjercicio;
  double peso;
  String? id;

  factory Pr.fromJson(String str) => Pr.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pr.fromMap(Map<String, dynamic> json) {
    return Pr(
      nameEjercicio: json["nameEjercicio"],
      peso: json["peso"].toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        "nameEjercicio": nameEjercicio,
        "peso": peso,
      };
}
