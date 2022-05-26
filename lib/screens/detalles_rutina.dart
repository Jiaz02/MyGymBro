import 'package:flutter/material.dart';
import 'package:my_gym_bro/models/rutina.dart';

import '../theme/app_theme.dart';

class DetallesRutina extends StatelessWidget {
  DetallesRutina({Key? key, required this.rutina}) : super(key: key);

  Rutina rutina;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDarkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: AppTheme.primaryBlue,
          title: const Text('My Gym Bro'),
          centerTitle: true,
        ),
      ),
      body: ListView.builder(
          itemCount: rutina.listEjerciciosRutina.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(rutina.listEjerciciosRutina[index].name),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         DetallesRutina(rutina: listas.rutinasList[index]),
                //   ),
                // );
              },
            );
          }),
    );
  }
}
