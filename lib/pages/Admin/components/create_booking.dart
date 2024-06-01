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
              maxLines: null,
               onChanged: (value) => controller.calculateTotalPrice(tour.price),
              decoration: const InputDecoration(
                labelText: 'Numero de personas',
              ),
            ),
            TextField(
              maxLines: null,
              enabled: false,
              controller: controller.totalPriceController,
              decoration: const InputDecoration(
                labelText: 'precio',
              ),
            ),
            TextField(
              maxLines: null,
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
