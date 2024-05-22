import 'package:get/get.dart';
import 'package:myapp/models/user_model.dart';

class UserController extends GetxController {
  UserModel user = UserModel(
      id: 0, name: '', email: '', phone: '', address: '', role: Rol.admin);
  final loadingWithOutUser = false.obs;

  void showLoading() {
    loadingWithOutUser.value = true;
  }

  void hideLoading() {
    loadingWithOutUser.value = false;
  }

  @override
  void onInit() async {
    Future.delayed(const Duration(seconds: 3), () {
      hideLoading();
      if (user.role == Rol.user) {
        Get.toNamed('/home');
      } else if (user.role == Rol.admin) {
        Get.toNamed('/admin');
      } else {
        Get.toNamed('/login');
      }
    });

    super.onInit();
  }
}
