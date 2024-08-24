import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../theme/app_theme.dart';

class RevisarPr extends StatelessWidget {
  RevisarPr({Key? key}) : super(key: key);

//pantalla par revisar todos los pr que haya en un determinado usuario
  final controller = Get.find<Listas>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDarkBlue,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: AppTheme.primaryBlue,
          title: const Text('My Gym Bro'),
          centerTitle: true,
        ),
      ),
      body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (controller.prList.isEmpty) {
          //Mostramos un mensaje en caso de que no haya ningun pr guardado
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Añade un PR para verlos aqui',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ));
        }
        //listamos los pr
        return ListView.builder(
          itemCount: controller.prList.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (_, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 50),
              child: Row(
                children: [
                  Text(
                    controller.prList[index].nameEjercicio,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Expanded(child: Container()),
                  Text(
                    controller.prList[index].peso.toString() + 'Kg',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            );
          },
        );
      }, future: null,),
    );
  }
}
