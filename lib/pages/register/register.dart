import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/Auth/register_controller.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {

    RegisterController registerCtr = Get.put(RegisterController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          const Text('Create una cuenta',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                          TextField(
                            
                             keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            controller: registerCtr.emailController,
                          ),
                          Obx(() => TextField(
                                controller: registerCtr.passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: const OutlineInputBorder(),
                                  errorText: registerCtr.errorMessage.value ==
                                          'Passwords do not match'
                                      ? registerCtr.errorMessage.value
                                      : null,
                                ),
                              )),
                          Obx(() => TextField(
                                controller:
                                    registerCtr.confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  border: const OutlineInputBorder(),
                                  errorText: registerCtr.errorMessage.value ==
                                          'Passwords do not match'
                                      ? registerCtr.errorMessage.value
                                      : null,
                                ),
                              )),
                          Obx(() => registerCtr.isLoading.value
                              ? const CircularProgressIndicator()
                              : SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: registerCtr.register,
                                    child: const Text('Registarse'),
                                  ),
                                )),
                          Obx(() => registerCtr.errorMessage.value.isNotEmpty
                              ? Text(
                                  registerCtr.errorMessage.value,
                                  style: const TextStyle(color: Colors.red),
                                )
                              : Container()),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                            onPressed: () => registerCtr.navigateToLogin,
                            child: const Text(
                              'Login',
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
