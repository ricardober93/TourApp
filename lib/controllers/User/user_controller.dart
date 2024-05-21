import 'package:get/get.dart';
import 'package:myapp/pages/home/home.dart';

class UserController extends GetxController{
  
  var user = true;
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
       Get.to(const Home());
    });

    super.onInit();
  }

}