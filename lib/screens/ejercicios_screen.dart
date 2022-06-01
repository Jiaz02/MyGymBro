import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:my_gym_bro/service/leer_json_service.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../service/service.dart';

class EjerciciosScreen extends StatelessWidget {
  EjerciciosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leerService = Provider.of<LeerJsonService>(context, listen: false);

    return FutureBuilder<Ejercicio>(
      future: leerService.fetchEjercicio(),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EjercicioDetailScreen(
                            ejercicio: snapshot.data!.ejercicio[index]),
                      ),
                    );
                  },
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
