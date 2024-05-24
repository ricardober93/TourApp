import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/Auth/login_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      const Text('Bienvenido a TourApp',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                      TextField(
                        controller: loginController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Usernrame',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextField(
                        controller: loginController.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                         obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Obx(
                        () => loginController.isLoading.value
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () => loginController.login(),
                                  child: const Text('Login',
                                      style: TextStyle(fontSize: 20)),
                                )),
                      ),
                      Obx(() => loginController.errorMessage.value.isNotEmpty
                          ? Text(
                              loginController.errorMessage.value,
                              style: const TextStyle(color: Colors.red),
                            )
                          : Container()),
                    ]),
              ),
              TextButton(
                  onPressed: () {}, child: const Text('Forgot Password?')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: () => loginController.navigateToRegister(),
                      child: const Text(
                        'Sign Up',
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
