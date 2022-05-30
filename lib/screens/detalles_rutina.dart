import 'package:flutter/material.dart';
import 'package:my_gym_bro/models/rutina.dart';
import 'package:my_gym_bro/screens/add_entrenos_screen.dart';
import 'package:my_gym_bro/screens/screens.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              rutina.name,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: rutina.listEjerciciosRutina.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      rutina.listEjerciciosRutina[index].name,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditarEjercicioRutinaScreen(ejercicio: rutina.listEjerciciosRutina[index]),
                        ),
                      );
                    },
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              rutina.note,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {},
              child: Text('Añadir Ejercicio'),
              style: TextButton.styleFrom(
                  backgroundColor: AppTheme.primaryBlue,
                  primary: Colors.white,
                  fixedSize: Size(MediaQuery.of(context).size.width, 16)),
            ),
          )
        ],
      ),
    );
  }
}
