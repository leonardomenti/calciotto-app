import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

String host_address = "35.152.52.209";

Future<int> login(username, password) async{
  final response =  await http.post(
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

  return response.statusCode;
}


void main() async{
  test ('Login Corretto', () async {
    final response = await login('tiziano', 'tiziano');
    expect(response,200);
  });
  test ('Login Errato', () async {
    final response = await login('wrong', 'wrong');
    expect(response,401);
  });
}
