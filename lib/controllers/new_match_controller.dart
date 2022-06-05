import 'dart:convert';
import 'package:calciotto/api/api.dart';

class NewMatchController{

  static Future<String> create_match(String home, String away, String date) async{
    var res = await Api.createMatch(home, away, date);
    if (res.statusCode == 201){
      return "OK";
    }
    return "ERROR";
  }

}