import 'dart:convert';
import 'package:http/http.dart' as http;

class Api{
  static String host_address = '15.161.230.197';

  static Future<String> getToken() async{
    final response =  await http.post(
      Uri.parse('http://' + host_address + ':80/api/v1/security/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': 'tiziano',
        'password': 'tiziano',
        'provider': 'db',
      }),
    );

    return response.body;
  }
}