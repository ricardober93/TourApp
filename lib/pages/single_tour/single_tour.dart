import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/Tour/tour_single_controller.dart';

import 'package:myapp/pages/Admin/components/create_booking.dart';
import 'package:myapp/utils/double_extension.dart';
import 'package:myapp/utils/string_extension.dart';

class SingleTour extends StatelessWidget {
  const SingleTour({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TourSingleController());

    controller.onInit();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Tour'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Image.network(controller.tour.value.image ),
                const SizedBox(height: 16),
                Text(
                  controller.tour.value.name ,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.tour.value.price
                              .formatAsCurrency(
                                  symbol: controller.tour.value.currency)
                              .toString() ,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          controller.tour.value.duration.formatDuration() ,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 16),
                Text(
                  controller.tour.value.description ,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child:  !controller.isBooked.value
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Get.bottomSheet(CreateBooking(
                                    tour: controller.tour.value));
                              },
                              child: const Text('Book Now'),
                            )
                          : ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('it is booked'),
                            ),
                    ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
