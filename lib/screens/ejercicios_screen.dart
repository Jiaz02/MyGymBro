import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

Future<Ejercicio> fetchEjercicio() async {
  final response = await http.get(Uri.parse('/assets/ejercicios.json'));

  if (response.statusCode == 200) {
    print(" contenido " + response.body);
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return Ejercicio.fromJson(json.decode(response.body));
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
          return ListView.builder(
              itemCount: snapshot.data?.ejercicio.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data!.ejercicio[index].name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EjercicioDetailScreen(ejercicio: snapshot.data!.ejercicio[index]),
                  ),
                );},
                );
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return CircularProgressIndicator();
        // Por defecto, muestra un loading spinner
      },
    );
  }
}
