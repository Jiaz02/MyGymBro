import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/amigo.dart';
import 'package:my_gym_bro/models/models.dart';

import 'package:http/http.dart' as http;
import 'package:my_gym_bro/models/user.dart';

class RutinaService extends ChangeNotifier {
  final String _baseUrl =
      'mygymbro-f072a-default-rtdb.europe-west1.firebasedatabase.app';

  final database = FirebaseDatabase.instance.ref();

  final controller = Get.find<Listas>();

  final storage = const FlutterSecureStorage();

  bool isLoading = true;

  bool isSaving = false;

  RutinaService() {
    //loadRutinas();
    //loadPrs();
    loadUsers();
  }

//cargamos las rutinas de la base de datos
  Future loadRutinas() async {
    final String user = await storage.read(key: 'nombre') ?? '';
    final url = Uri.https(_baseUrl, 'users/$user/rutinas.json');
    final resp = await http.get(url);


    final Map<String, dynamic> rutinasMap = json.decode(resp.body);

    rutinasMap.forEach((key, value) {
      final tempRutina = Rutina.fromMap(value);
      tempRutina.id = key;
      if (tempRutina.idUser == user) {
        controller.rutinasList.add(tempRutina);
      }
    });
  }

//cargamos los pr
  Future loadPrs() async {
    final String user = await storage.read(key: 'nombre') ?? '';
    final url = Uri.https(_baseUrl, 'users/$user/prs.json');
    final resp = await http.get(url);

    final Map<String, dynamic> prMap = json.decode(resp.body);

    prMap.forEach((key, value) {
      final tempPr = Pr.fromMap(value);
      tempPr.id = key;
      if (tempPr.idUser == user) {
        controller.prList.add(tempPr);
      }
    });
  }

  Future getSolicitudAmistad() async {
    final String? usuario = await storage.read(key: 'nombre');
    final usuarioDestinoSnapshot = await database.child("peticiones_amistad").orderByChild('para').equalTo(usuario).once();
    if (usuarioDestinoSnapshot.snapshot.exists) {
      final data = usuarioDestinoSnapshot.snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        // Convierte cada valor del mapa en un objeto Rutina
        controller.solicitudesAmistadList.add(SolicitudAmistad.fromMap(Map<String, dynamic>.from(value)));
        print(controller.solicitudesAmistadList);
      });
    }
  }

  Future loadUsers() async {
    final String? usuario = await storage.read(key: 'nombre');
    final url = Uri.https(_baseUrl, 'users/$usuario.json');
    final resp = await http.get(url);

    final Map<String, dynamic> userMap = json.decode(resp.body);

/*
    userMap.forEach((key, value) {
      if(key == 'prs'){
        controller.prList = value.values
        .where((item) => item != null)
        .map((item) => Pr.fromMap(item as Map<String, dynamic>))
        .toList()
        .cast<Pr>();
      } else if(key == 'rutinas') {
        controller.rutinasList = value.values
        .where((item) => item != null)
        .map((item) => Rutina.fromMap(item as Map<String, dynamic>))
        .toList()
        .cast<Rutina>();
      }
    });
    */
      final tempUser = User.fromMap(userMap);
      controller.userList.add(tempUser);
      controller.rutinasList = tempUser.rutinas ?? [];
      controller.prList = tempUser.pr ?? [];
      controller.amigosList = tempUser.amigos ?? [];
  }

//guardamo a creamos una rutina
  Future saveOrCreateRutina(Rutina rutina) async {
    isSaving = true;
    notifyListeners();

    final String user = await storage.read(key: 'nombre') ?? '';
    rutina.idUser = user;

    //si tenemos id estamos actualizando, sino estamos creando :D
    if (rutina.id == null) {
      await createRutina(rutina);
      //creamos producto
    } else {
      //actualizamos producto
      await updateRutina(rutina);
    }

    isSaving = false;
    notifyListeners();
  }

//update rutina
  Future<String> updateRutina(Rutina rutina) async {
//HACEMOS LA PETICION

    final String user = await storage.read(key: 'nombre') ?? '';

    await database.child("users").child(user).child('rutinas').child(rutina.id!).set(rutina.toMap());
    final url = Uri.https(_baseUrl, 'users/$user/rutinas/${rutina.id}.json');
    //final resp = await http.put(url, body: rutina.toJson());
    //final decodedData = resp.body;

    return rutina.id!;
  }

//create rutina
  Future<String> createRutina(Rutina rutina) async {
//HACEMOS LA PETICION

    final String user = await storage.read(key: 'nombre') ?? '';
    final url = Uri.https(_baseUrl, 'users/$user/rutinas.json');
    final resp = await http.post(url, body: rutina.toJson());
    final decodedData = json.decode(resp.body);
    print(decodedData);

    rutina.id = decodedData['name'];

    return rutina.id!;
  }

//eliminamos rutina
  Future deleteRutina(Rutina rutina) async {
    final String user = await storage.read(key: 'nombre') ?? '';
    final url = Uri.https(_baseUrl, 'users/$user/rutinas/${rutina.id}.json');
    http.delete(url);
  }

//creamos o modificamos pr
  Future saveOrCreatePr(Pr pr) async {
    isSaving = true;
    notifyListeners();

    final String user = await storage.read(key: 'nombre') ?? '';
    pr.idUser = user;

    List<String> lst = [];

    for (var item in controller.prList) {
      lst.add(item.nameEjercicio);
    }

    if (lst.contains(pr.nameEjercicio)) {
      for (var item in controller.prList) {
        if (pr.nameEjercicio == item.nameEjercicio) {
          item.peso = pr.peso;
          await updatePr(item);
          return;
        }
      }
    } else {
      controller.prList.add(pr);
      await createPr(pr);
    }

    isSaving = false;
    notifyListeners();
  }

//creamos pr
  Future<String> createPr(Pr pr) async {
//HACEMOS LA PETICION

    final String user = await storage.read(key: 'nombre') ?? '';
    final url = Uri.https(_baseUrl, 'users/$user/prs.json');
    final resp = await http.post(url, body: pr.toJson());
    final decodedData = json.decode(resp.body);
    print(decodedData);

    pr.id = decodedData['name'];

    return pr.id!;
  }

//modificamos pr
  Future<String> updatePr(Pr pr) async {
//HACEMOS LA PETICION

    final String user = await storage.read(key: 'nombre') ?? '';
    print(pr.id);
    final url = Uri.https(_baseUrl, 'users/$user/prs/${pr.id}.json');
    final resp = await http.put(url, body: pr.toJson());
    final decodedData = resp.body;
    print(decodedData);

    return pr.id!;
  }

//update User
  Future<String> updateUser(User user) async {
//HACEMOS LA PETICION

    final url = Uri.https(_baseUrl, 'users/${user.id}.json');
    final resp = await http.put(url, body: user.toJson());
    final decodedData = resp.body;
    print(decodedData);

    return user.id!;
  }

  Future<void> sendPeticionAmistad(String nombreUsuario) async {
    final String usuario = await storage.read(key: 'nombre') ?? '';
    final database = FirebaseDatabase.instance.ref();
    final usuarioDestinoSnapshot = await database.child("users").child(nombreUsuario).once();
    if (usuarioDestinoSnapshot.snapshot.exists) {
      // El usuario existe, puedes proceder
      final peticionExistente = await database.child("peticiones_amistad")
      .child("${usuario}_$nombreUsuario")
      .once();
  
      if (peticionExistente.snapshot.exists) {
        print('peticion existente');
        // Verifica si la solicitud ya ha sido enviada
      } else {
        // Proceder a crear una nueva solicitud
        await database.child("peticiones_amistad").child("${usuario}_$nombreUsuario")
        .set({
        "de": usuario,
        "para": nombreUsuario,
        "estado": "pendiente"
});
      }
    } else {
      // Mostrar mensaje de error: "El usuario no existe"
      print('fuea');
    }
  }
}
