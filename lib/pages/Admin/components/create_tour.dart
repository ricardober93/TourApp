import 'package:flutter/material.dart';
import 'package:myapp/controllers/Admin/tour_admin_controller.dart';

class CreateTour extends StatelessWidget {
  final TourAdminController controller;

  const CreateTour({super.key, required this.controller});

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
              controller: controller.nameController,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
          
            TextField(
              maxLines: null,
              controller: controller.descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
          
            TextField(
              maxLines: null,
              controller: controller.priceController,
              decoration: const InputDecoration(
                labelText: 'precio',
              ),
            ),
          
            TextField(
              maxLines: null,
              controller: controller.dateController,
              decoration: const InputDecoration(
                labelText: 'Fecha',
              ),
              readOnly: true,
              onTap: () => controller.selectDate(context),
            ),
          
            TextField(
              controller: controller.durationController,
              decoration: const InputDecoration(
                labelText: 'duracion',
              ),
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
                  controller.addTour();
                },
                child: const Text('Finalizar Tour'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
