import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/User/user_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  UserController userController = Get.put(UserController());

  final SupabaseClient client = Supabase.instance.client;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void login() async {
    errorMessage.value = '';


    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      errorMessage.value = 'Please fill in all fields';
      return;
    }

    isLoading.value = true;

    try {
     
     await userController.signIn(
       emailController.value.text,
      passwordController.value.text,
    );
  

    if(userController.role.value == 'user') {
      Get.offAllNamed('/home');
    } else if(userController.role.value == 'super_admin'){
       Get.offAllNamed('/admin');
    }
     
     
    isLoading.value = false;

    } catch (e) {
       isLoading.value = false;
      errorMessage.value = 'Invalid email or password';
    }


  
  }

  void navigateToRegister() {
    Get.toNamed('/register');
  }
}
