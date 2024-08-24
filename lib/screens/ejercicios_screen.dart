
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/screens/screens.dart';

import '../models/models.dart';

class EjerciciosScreen extends StatelessWidget {
  const EjerciciosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<Listas>();

//lista de todos los ejercicios disponibles
    return ListView.builder(
        itemCount: controller.ejerciciosList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              controller.ejerciciosList[index].name,
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EjercicioDetailScreen(
                      ejercicio: controller.ejerciciosList[index]),
                ),
              );
            },
          );
        });
  }
}
