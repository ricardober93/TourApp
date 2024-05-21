import 'package:get/get.dart';

class UserController extends GetxController{
  
  var user = false;
  final loadingWithOutUser = false.obs;
  
  void showLoading(){
    loadingWithOutUser.value = true;
  }
  
  void hideLoading(){
    loadingWithOutUser.value = false;
  }

 @override
  void onInit() async {

    Future.delayed(const Duration(seconds: 3), () {
      hideLoading();
     if (user) {
       Get.toNamed('/home');
     }else{
      Get.toNamed('/login');
     }
    });

    super.onInit();
  }

}