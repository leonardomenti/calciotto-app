import 'package:flutter/material.dart';
import 'package:calciotto/api/api.dart';

class LoginController{

  static login_user(String username, String password) async{
    final response = await Api.login(username, password);
  }

}