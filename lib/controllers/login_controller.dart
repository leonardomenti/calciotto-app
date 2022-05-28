import 'dart:convert';

import 'package:calciotto/api/api.dart';
import 'package:calciotto/services/secure_storeage.dart';

class LoginController{

  static Future<String> login_user(String username, String password) async{
    var res =  await Api.login(username, password);
    if (res.statusCode == 200){
      StorageService ss = StorageService();
      ss.writeSecureData('token', jsonDecode(res.body)["access_token"]);
      ss.writeSecureData('username', username);
      var role= await getRole(username);
      print(role);
      return role;
    }
    return "";
  }

  static Future<String> getRole(String username) async{
    var res =  await Api.getRole(username);
    if (res.statusCode == 200){
      StorageService ss = StorageService();
      ss.writeSecureData('role', jsonDecode(res.body)["message"]);
      return jsonDecode(res.body)["message"];
    }
    else return "ERROR";
  }
}