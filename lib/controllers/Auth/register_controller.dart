import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/User/user_controller.dart';
import 'package:myapp/controllers/storage/storage_controller.dart';

class RegisterController extends GetxController {
  UserController userController = Get.put(UserController());
  StorageController storageController = Get.put(StorageController());
 

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void register() async {
    errorMessage.value = '';

    if (passwordController.text != confirmPasswordController.text) {
      errorMessage.value = 'Passwords do not match';
      return;
    }

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      errorMessage.value = 'Please fill in all fields';
      return;
    }

    // Simulate a network call
    isLoading.value = true;
    var res = await userController.signUpWithEmailAndPassword(
       emailController.value.text,
      emailController.value.text,
    );

    
    userController.session = res.session;
    userController.user = res.user;

    storageController.saveData('user', res.user.toString());
    storageController.saveData('session', res.session.toString());

    isLoading.value = false;

    var role = await userController.getUserRole(userController.user!.id);

    if( role!.isEmpty){
      Get.toNamed('/login');
      return;
    }

    // Simulate registration success
    if ( role == 'super_admin') {
      Get.toNamed('/admin');
    } else {
      Get.toNamed('/home');
    }
  }

  void navigateToLogin() {
    Get.toNamed('/login');
  }


  

}


