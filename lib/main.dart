import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/pages/Admin/Home/home_admin.dart';
import 'package:myapp/pages/Admin/Tour/tour_admin.dart';
import 'package:myapp/pages/Admin/reservas/reservas_admin.dart';
import 'package:myapp/pages/LoadingScreen/loading_screen.dart';
import 'package:myapp/pages/Settings/settings.dart';
import 'package:myapp/pages/booking/booking.dart';
import 'package:myapp/pages/home/home.dart';
import 'package:myapp/pages/login/login.dart';
import 'package:myapp/pages/profile/profile.dart';
import 'package:myapp/pages/register/register.dart';
import 'package:myapp/pages/single_tour/single_tour.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoadingScreen()),
        GetPage(name: '/home', page: () => const Home()),
         GetPage(name: '/bookings', page: () => const Bookings()),
        GetPage(
          name: '/tour/:tourId',
          page: () => const SingleTour(),
          transition: Transition.native,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/register', page: () => const Register()),
        GetPage(name: '/profile', page: () => const Profile()),
        GetPage(name: '/settings', page: () => const Settings()),
        GetPage(
          name: '/admin',
          page: () => const HomeAdmin(),
          transition: Transition.native,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(name: '/admin/tour', page: () => const TourAdmin()),
        GetPage(name: '/admin/reservas', page: () => const ReservasAdmin()),
      ],
    );
  }
}
