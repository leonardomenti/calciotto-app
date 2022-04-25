import 'dart:convert';
import 'package:http/http.dart' as http;

class Api{

  static String host_address = '15.160.234.48';

  static Future<http.Response> login(String username, String password) async{
    return await http.post(
      Uri.parse('http://' + host_address + ':80/api/v1/security/login'),
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

  static Future<http.Response> signup(username, firstName, lastName, email, password) async{
    return await http.post(
      Uri.parse('http://' + host_address + ':80/api/v1/user/signup'),
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
}
