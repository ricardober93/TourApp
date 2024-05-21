import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/Tour/tour_controller.dart';
import 'package:myapp/pages/components/tour_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

      var controller = Get.put(TourController());
    controller.onInit();

    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tours'),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: ListView.builder(
        itemBuilder: (context, index) {
          final tour =  controller.tours[index];
          return TourCard(tour: tour);
        },
        itemCount: controller.tours.length,
        ),
        )
    );
  }
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3767388960.


}
