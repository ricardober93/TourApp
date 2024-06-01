import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/booking/booking_controller.dart';
import 'package:myapp/pages/components/drawer.dart';
import 'package:myapp/utils/double_extension.dart';
import 'package:myapp/utils/string_extension.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookingController());

    controller.onInit();

    return Scaffold(
       drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Reservas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: 
           Obx(() {
            return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final book = controller.bookings[index];
              return ListTile(
                title: Text(book.tours?.name ?? ''),
                subtitle: Text('${book.status} - ${book.date.formatAsDate()}'),
                trailing: Text(book.totalPrice.formatAsCurrency()),
                onTap: () {
 
                });
            },
            itemCount: controller.bookings.length,
          );
           }),
        ));
  }
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3767388960.
}