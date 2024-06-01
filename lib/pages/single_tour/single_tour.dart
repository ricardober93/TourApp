import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/Tour/tour_controller.dart';
import 'package:myapp/models/tour_model.dart';
import 'package:myapp/pages/Admin/components/create_booking.dart';
import 'package:myapp/utils/double_extension.dart';
import 'package:myapp/utils/string_extension.dart';

class SingleTour extends StatelessWidget {
  const SingleTour({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TourController());

    Tour tour = controller.getSingleTour();

    return Scaffold(
      appBar: AppBar(
        title: Text(tour.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Image.network(tour.image),
              const SizedBox(height: 16),
              Text(
                tour.name,
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
                    tour.price.formatAsCurrency(symbol: tour.currency),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    tour.duration.formatDuration(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              Text(
                tour.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Get.bottomSheet(CreateBooking(tour: tour));
                  },
                  child: const Text('Book Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
