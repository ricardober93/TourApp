import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/LoadingScreen/loading_screen.dart';
import 'package:myapp/pages/Settings/settings.dart';
import 'package:myapp/pages/home/home.dart';
import 'package:myapp/pages/login/login.dart';
import 'package:myapp/pages/profile/profile.dart';
import 'package:myapp/pages/single_tour/single_tour.dart';

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
        GetPage(
          name: '/tour/:tourId',
          page: () => const SingleTour(),
          transition: Transition.native,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/profile', page: () => const Profile()),
        GetPage(name: '/settings', page: () => const Settings()),
      ],
    );
  }
}