import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
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
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;

    // Simulate registration success
    if (emailController.value.text == 'admin' && passwordController.value.text == 'admin') {
      Get.toNamed('/admin');
    }else{
      Get.toNamed('/home');
    }
  }


  void navigateToLogin() {
     Get.toNamed('/login');
  }
}
