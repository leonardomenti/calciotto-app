import 'package:calciotto/api/api.dart';
import 'package:calciotto/services/secure_storeage.dart';

class RegistrationController{

  static Future<int> register_user(
      String username,
      String first_name,
      String last_name,
      String email,
      String password) async{
    var res =  await Api.signup(username, first_name, last_name, email, password);
    if (res.statusCode == 200){
      print('body: ' + res.body);
    }
    return res.statusCode;
  }
}