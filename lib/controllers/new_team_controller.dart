import 'dart:convert';
import 'package:calciotto/api/api.dart';
import 'package:calciotto/services/secure_storeage.dart';

class NewTeamController{

  static Future<String> create_team(String name, String player1, String player2, String player3,
      String player4, String player5, String player6, String player7, String player8) async{
    StorageService ss = new StorageService();
    var token = await ss.readSecureData('token');
    var res =  await Api.createTeam(name,player1,player2,player3,player4,player5,player6,player7,player8,token);
    if (res.statusCode == 201){
      return "OK";
    }
    return "ERROR";
  }

}