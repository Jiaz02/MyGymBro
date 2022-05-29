import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

Future<Ejercicio> fetchEjercicio() async {
  final response = await http.get(Uri.parse('/assets/ejercicios.json'));

  if (response.statusCode == 200) {
    print(" contenido " + response.body);
    final jsonm = "[" + response.body + "]";
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return Ejercicio.fromJson(json.decode(jsonm));
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

class EjerciciosScreen extends StatelessWidget {
  EjerciciosScreen({Key? key}) : super(key: key);

  Future<Ejercicio> ejercicio = fetchEjercicio();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Ejercicio>(
      future: ejercicio,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.name);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // Por defecto, muestra un loading spinner
        return CircularProgressIndicator();
      },
    );
  }
}
