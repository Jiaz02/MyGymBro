import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  Future<http.Response> fetchPost() async {
    var response =
        await http.get(Uri.parse('/assets/ejercicios.json/ejercicio'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return http.get(Uri.parse('/assets/ejercicios.json/ejercicio'));
  }
}
