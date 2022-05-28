import 'dart:convert';
import 'package:http/http.dart' as http;

class Api{

  static String hostAddress = "18.102.9.43";

  static Future<http.Response> login(String username, String password) async{
    return await http.post(
      Uri.parse('http://' + hostAddress + ':80/api/v1/security/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'provider': 'db',
      }),
    );
  }

  static Future<http.Response> signup(username, firstName, lastName, email, password) async {
    return await http.post(
      Uri.parse('http://' + hostAddress + ':80/api/v1/user/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'provider': 'db',
      }),
    );
  }

  static Future<http.Response> listUsers() async{
    return await http.get(
      Uri.parse('http://' + hostAddress + ':80/api/v1/user/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
  }

  static Future<http.Response> getRole(username) async {
    return await http.post(
      Uri.parse('http://' + hostAddress + ':80/api/v1/user/get_role'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username
      }),
    );
  }
}
