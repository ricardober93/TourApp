import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/Tour/tour_controller.dart';
import 'package:myapp/pages/components/drawer.dart';
import 'package:myapp/pages/components/tour_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TourController());
    controller.onInit();

    navigateSingleTour(int tourId) {
      controller.navigateSinglertour(tourId);
    }

    favorited(int tourId) {
      print(tourId);
      controller.favorited(tourId);
    }

    return Scaffold(
       drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Tours'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: 
           Obx(() {
            return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final tour = controller.tours.value[index];
              return TourCard(tour: tour, onTap: navigateSingleTour, onFavorite: favorited );
            },
            itemCount: controller.tours.value.length,
          );
           }),
        ));
  }
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3767388960.
}
