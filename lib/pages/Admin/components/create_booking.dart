import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/controllers/booking/booking_controller.dart';
import 'package:myapp/models/tour_model.dart';

class CreateBooking extends StatelessWidget {
  final controller = Get.put(BookingController());


  final Tour tour;

  CreateBooking({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {

      controller.dateController.text = DateTime.now().toString().substring(0, 10);
      controller.totalPriceController.text = tour.price.toString().split('.')[0];
      controller.numberPeopleController.text = '1';

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            TextField(
              controller: controller.numberPeopleController,
               onChanged: (value) => controller.calculateTotalPrice(),
              decoration: const InputDecoration(
                labelText: 'Numero de personas',
              ),
            ),
            TextField(
              enabled: false,
              controller: controller.totalPriceController,
              decoration: const InputDecoration(
                labelText: 'precio',
              ),
            ),
            TextField(
              controller: controller.dateController,
              decoration: const InputDecoration(
                labelText: 'fecha',
              ),
              readOnly: true,
              onTap: () => controller.selectDate(context),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  controller.createBooking(tour.id);
                },
                child: const Text('Crear Reserva'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
