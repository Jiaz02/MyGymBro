import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _baseUrlUser =
      'mygymbro-f072a-default-rtdb.europe-west1.firebasedatabase.app';
  final String _firebaseToken = 'AIzaSyC7oi6d2C3_dDuAXLImUpBMxvOS2_Ympu0';

  final database = FirebaseDatabase.instance.ref();

  final storage = const FlutterSecureStorage();


  // Si retornamos algo, es un error, si no, todo bien!
  Future<String?> createUser(String email, String password, user) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

//creamos la url con uri.https
    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

//guardamos el token que nos devuelve
    if (decodedResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);

      await storage.write(key: 'uid', value: decodedResp['localId']);
      await storage.write(key: 'nombre', value: user.email);
      final userMap = user.toMap();
      userMap.forEach((key, value) {
      key = decodedResp['localId'];
    });
    await database.child("users").child(user.nombre).set(userMap);
  //  final decodedData = json.decode(resp.body);
  //  print(decodedData);

  //  rutina.id = decodedData['name'];

      // decodedResp['idToken'];
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
//creamos la url
    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
//guardamos el token
    if (decodedResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      // decodedResp['idToken'];
      await storage.write(key: 'token', value: decodedResp['idToken']);

      await storage.write(key: 'uid', value: decodedResp['localId']);
      await storage.write(key: 'nombre', value: email);
      return null;
    } else {
      print('cagaste');
      return decodedResp['error']['message'];
    }
  }

  Future logout() async {
    //limpiamos el storage al salir
    await storage.deleteAll();
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
