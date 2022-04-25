import 'package:calciotto/api/api.dart';
import 'package:calciotto/services/secure_storeage.dart';

class LoginController{

  static Future<int> login_user(String username, String password) async{
    var res =  await Api.login(username, password);
    if (res.statusCode == 200){
      //print('token: ' + res.body);
      StorageService ss = StorageService();
      ss.writeSecureData('token', res.body);
    }
    return res.statusCode;
  }
}