import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/models.dart';

import 'package:http/http.dart' as http;

class RutinaService extends ChangeNotifier {
  final String _baseUrl =
      'mygymbro-f072a-default-rtdb.europe-west1.firebasedatabase.app';

  final controller = Get.find<Listas>();

  bool isLoading = true;

  bool isSaving = false;

  RutinaService() {
    this.loadRutinas();
    this.loadPr();
  }

  Future loadRutinas() async {
    final url = Uri.https(_baseUrl, 'rutinas.json');
    final resp = await http.get(url);

    final Map<String, dynamic> rutinasMap = json.decode(resp.body);

    rutinasMap.forEach((key, value) {
      final tempRutina = Rutina.fromMap(value);
      tempRutina.id = key;
      controller.rutinasList.add(tempRutina);
    });
  }

  Future loadPr() async {
    final url = Uri.https(_baseUrl, 'pr.json');
    final resp = await http.get(url);

    final Map<String, dynamic> prMap = json.decode(resp.body);

    print(prMap);

    prMap.forEach((key, value) {
      final tempPr = Pr.fromMap(value);
      tempPr.id = key;
      controller.prList.add(tempPr);
    });
  }

  Future saveOrCreateRutina(Rutina rutina) async {
    isSaving = true;
    notifyListeners();

    //si tenemos id estamos actualizando, sino estamos creando :D
    if (rutina.id == null) {
      //creamos producto
    } else {
      //actualizamos producto
      await updateRutina(rutina);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateRutina(Rutina rutina) async {
//HACEMOS LA PETICION

    final url = Uri.https(_baseUrl, 'rutinas/${rutina.id}.json');
    final resp = await http.put(url, body: rutina.toJson());
    final decodedData = resp.body;
    print(decodedData);

    return rutina.id!;
  }
}
