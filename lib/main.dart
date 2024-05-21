import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/LoadingScreen/loading_screen.dart';
import 'package:myapp/pages/home/home.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoadingScreen()),
        GetPage(name: '/home', page: () => const Home()),
      ],
    );
  }
}