import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/Admin/tour_admin_controller.dart';
import 'package:myapp/pages/Admin/components/create_tour.dart';
import 'package:myapp/pages/Admin/components/edit_tour.dart';

class TourAdmin extends StatelessWidget {
  const TourAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TourAdminController());

    controller.onInit();

    return Scaffold(
      appBar: AppBar(
        title: const Text(' Toures - Admin'),
      ),
      body: Center(
          child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: [
          Obx(() {
            return ListView.builder(
              itemBuilder: (context, index) {
                var tour = controller.tours.value[index];
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    controller.deleteTour(tour.id);
                  },
                  key: Key(tour.id.toString()),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    onTap: () {
                      controller.selectItem(tour);
                      Get.bottomSheet(EditTour( controller: controller,));
                    },
                    contentPadding: const EdgeInsets.all(4),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(tour.image),
                    ),
                    title: Text(tour.name,
                        style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        )),
                    subtitle: Text(tour.description,
                        style: const TextStyle(
                            fontSize: 14, overflow: TextOverflow.ellipsis)),
                  ),
                );
              },
              itemCount: controller.tours.value.length,
            );
          }),
          Positioned(
            bottom: 5,
            child: SizedBox(
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
                    Get.bottomSheet(CreateTour( controller: controller, ));
                  },
                  child: const Text('Add new Tour')),
            ),
          )
        ],
      )),
    );
  }
}
