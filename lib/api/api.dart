import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:calciotto/services/secure_storeage.dart';

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

  static Future<String> listUsers() async{
    var res= await http.get(
      Uri.parse('http://' + hostAddress + ':80/api/v1/user/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
    return res.body;
  }

  static Future<String> listTeams() async{
    StorageService ss = new StorageService();
    var token = await ss.readSecureData('token');
    var res= await http.get(
        Uri.parse('http://' + hostAddress + ':80/api/v1/team/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : 'Bearer '+ token,
        }
    );
    return res.body;
  }

  static Future<http.Response> createMatch(String home, String away, String date) async{
    StorageService ss = new StorageService();
    var token = await ss.readSecureData('token');
    var res= await http.post(
        Uri.parse('http://' + hostAddress + ':80/api/v1/match/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : 'Bearer '+ token,
        },
      body: jsonEncode(<String, dynamic>{
        'home': int.parse(home),
        'away' : int.parse(away),
        'date' : date,
      }),
    );
    return res;
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

  static Future<http.Response> createTeam(String name, String player1, String player2, String player3,
      String player4, String player5, String player6, String player7, String player8, String token) async{
    return await http.post(
      Uri.parse('http://' + hostAddress + ':80/api/v1/team/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization' : 'Bearer '+ token
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'user_1' : int.parse(player1),
        'user_2' : int.parse(player2),
        'user_3' : int.parse(player3),
        'user_4' : int.parse(player4),
        'user_5' : int.parse(player5),
        'user_6' : int.parse(player6),
        'user_7' : int.parse(player7),
        'user_8' : int.parse(player8),
//        'user1' : player1,
      }),
    );
  }
}
