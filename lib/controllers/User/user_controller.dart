import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/storage/storage_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends GetxController {
  StorageController storageController = Get.put(StorageController());
  final SupabaseClient client = Supabase.instance.client;

  Session? session;
  User? user;
  var loadingWithOutUser = false.obs;
  var role = ''.obs;

  void showLoading() {
    loadingWithOutUser.value = true;
  }

  void hideLoading() {
    loadingWithOutUser.value = false;
  }

  signIn(String email, String password) async {
    try {
      final response = await client.auth
          .signInWithPassword(email: email, password: password);
      if (response.user != null) {
        var responseRole = await getUserRole(response.user!.id);
        role.value = responseRole!;
      }
      user = response.user;
      session = response.session;

      storageController.saveData('token', response.session!.accessToken);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserResponse> signUpAdmin(String email, String password) async {
    try {
      final res = await client.auth.admin.createUser(AdminUserAttributes(
        email: email,
        password: password,
        userMetadata: {'name': 'Ricardo'},
        emailConfirm: true,
        phone: '3145063381',
        phoneConfirm: true,
      ));

      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final response =
          await client.auth.signUp(email: email, password: password);
      if (response.user != null) {
        await assignRole(response.user!.id, 'user');
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> assignRole(String userId, String role) async {
    final response =
        await client.from('user_roles').upsert({'id': userId, 'role': role});

    if (response.error != null) {
      throw Exception('Error assigning role: ${response.error!.message}');
    }
  }

  Future<String?> getUserRole(String userId) async {
    try {
      final response = await client
          .from('user_roles')
          .select('role')
          .eq('id', userId)
          .single();

      var role = response;

      return role.values.first;
    } catch (e) {
      Get.snackbar('Error', 'Error fetching user role: $e',
          colorText: Colors.red);
      return null;
    }
  }

  @override
  void onInit() async {
    showLoading();

    try {
      var token = await storageController.readData('token');

      var userResponse = await client.auth.getUser(token);

      hideLoading();

      if (userResponse.user == null) {
        Get.toNamed('/login');
      }

      if (userResponse.user != null) {
        user = userResponse.user;
         role.value = (await getUserRole(userResponse.user!.id)).toString();
  
        if (role.value== 'user') {
          Get.toNamed('/home');
        }

        if (role.value == 'super_admin') {
          Get.toNamed('/admin');
        }
      }
    } catch (e) {
      Get.toNamed('/login');
    }

    super.onInit();
  }
}
