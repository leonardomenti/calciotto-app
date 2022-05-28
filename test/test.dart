import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

String host_address = "18.102.9.43";

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

Future<int> signup(username, firstName, lastName, email, password) async{
  final response =  await http.post(
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
  test ('Registrazione Corretta', () async {
    final response = await signup('username', 'firstName', 'LastName', 'test@example.com', 'password');
    expect(response,200);
  });
  test ('Utente già esistente', () async {
    final response = await signup('test', 'test', 'test', 'test', 'test');
    expect(response,401);
  });
}
