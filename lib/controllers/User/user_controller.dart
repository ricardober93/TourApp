import 'package:get/get.dart';
import 'package:myapp/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends GetxController {
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
      print('Error fetching user role: $e');
      return null;
    }
  }

  @override
  void onInit() async {
    Future.delayed(const Duration(seconds: 3), () {
      hideLoading();
      if (user?.role == Rol.user) {
        Get.toNamed('/home');
      } else if (user?.role == Rol.admin) {
        Get.toNamed('/admin');
      } else {
        Get.toNamed('/login');
      }
    });

    super.onInit();
  }
}
