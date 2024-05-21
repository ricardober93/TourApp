import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/User/user_controller.dart';
class LoadingScreen extends  StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(UserController());
    controller.onInit();

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFF000000),
            ) )
          ],
        ),
      ),
    );
  }
}