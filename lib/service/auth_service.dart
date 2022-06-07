import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyC7oi6d2C3_dDuAXLImUpBMxvOS2_Ympu0';

  final storage = FlutterSecureStorage();

  // void inputData() {
  //   final User? user = auth.currentUser;
  //   final uid = user?.uid;
  //   storage.write(key: 'uid', value: uid);
  // }

  // final FirebaseAuth auth = FirebaseAuth.instance;
  // Si retornamos algo, es un error, si no, todo bien!
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);
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

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      // decodedResp['idToken'];
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      print('cagaste');
      return decodedResp['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'uid');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
