
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyC7oi6d2C3_dDuAXLImUpBMxvOS2_Ympu0';


  Future<String?> createUser(String email, String password) async{

    final Map<String, dynamic> authData = {
      'email':email,
      'password':password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp',{
      'key':_firebaseToken
    });

    final resp = await http.post(url,body:json.encode(authData));

    final Map<String, dynamic> decodedResp = json.decode(resp.body);

  }


}