import 'dart:convert';

import 'dart:html';
import 'package:http/http.dart' as http;

class UserRepository {
  static String mainUrl = "192.168.0.104:8000";
  var loginUrl = '$mainUrl/api/v1/accounts/login/';

  final Storage _localStorage = window.localStorage;

  Future<bool> hasTokenWeb() async {
    // var value = await storage.read(key: 'token');
    var value = _localStorage['token'];

    // var value = "sas";
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    // await storage.write(key: 'token', value: token);
  }

  Future<void> persistTokenWeb(String token) async {
    // await storage.write(key: 'token', value: token);
    _localStorage['token'] = token;
  }

  Future<void> deleteToken() async {
    // storage.delete(key: 'token');
    // storage.deleteAll();
  }

  Future<void> deleteTokenWeb() async {
    // storage.delete(key: 'token');
    // storage.deleteAll();
    _localStorage.remove('token');
  }

  Future<String> login(String title, String password) async {
    final response = await http.post(
      Uri.http(mainUrl, '/api/v1/accounts/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": "samuray",
        "password": "q11111111",
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return response.body.toString();

      var jsonData = json.decode(response.body);
      return jsonData["token"];
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<String> register(
    String username,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.http(mainUrl, '/api/v1/accounts/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return response.body.toString();

      var jsonData = json.decode(response.body);
      return jsonData["token"];
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
