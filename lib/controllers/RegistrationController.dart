import 'package:calciotto/api/api.dart';

class RegistrationController{
  static registerNewUser(String username, String password, String email) {
    Future<String> token = Api.getToken();
  }

}