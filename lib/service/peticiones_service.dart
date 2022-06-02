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

  RutinaService() {
    this.loadRutinas();
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
}
