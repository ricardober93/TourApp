import 'package:get/get.dart';

class LoginController extends GetxController {

  var email = '';
  var password = '';

  onChageEmail( String value ){
    email = value;
  }

  onChagePassword( String value ){
    password = value;
  }

  void login() {
    print('email: $email');
    print('password: $password');
  }


}