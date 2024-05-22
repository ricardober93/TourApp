import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/tour_model.dart';

class TourAdminController extends GetxController {
  var tours = [
    Tour(
        id: 1,
        currency: "COP",
        name: "dolor purus non enim praesent elementum facilisis leo vel",
        image: "https://picsum.photos/400/200",
        date: "2021-10-10",
        description:
            "lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean et tortor at risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque",
        duration: "1",
        location: "New York",
        price: "240000"),
    Tour(
        id: 2,
        currency: "COP",
        name: "turpis in eu mi bibendum neque egestas congue quisque",
        image: "https://picsum.photos/400/200",
        date: "2021-10-10",
        description:
            "lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean et tortor at risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque",
        duration: "2",
        location: "San Juan del Cesar",
        price: "360000")
  ].obs;

  var selectedTour = Rxn<Tour>();
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var locationController = TextEditingController();
  var dateController = TextEditingController();
  var durationController = TextEditingController();
  var descriptionController = TextEditingController();

  void addTour() {
    var newTour = Tour(
      id: tours.length + 1,
      currency: "COP",
      name: nameController.text,
      image: "https://picsum.photos/400/200",
      date: (dateController.text.isNotEmpty
          ? DateTime.parse(dateController.text).toString()
          : null)!,
      description: descriptionController.text,
      duration: durationController.text,
      location: locationController.text,
      price: priceController.text,
    );
    tours.add(newTour);

    clearItem();
    Get.back();

    Get.snackbar(
      "Tour added",
      "The tour has been added successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void selectItem(Tour item) {
    selectedTour.value = item;
    nameController.text = item.name;
    descriptionController.text = item.description;
    priceController.text = item.price;
    locationController.text = item.location;
    durationController.text = item.duration;
    dateController.text = item.date;
  }

  void clearItem() {
    selectedTour.value = null;
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    locationController.clear();
    dateController.clear();
    durationController.clear();
  }

  void updateSelectedItem() {
    if (selectedTour.value != null) {
      Get.back(closeOverlays: true, canPop: true); // Close the editing form
      selectedTour.value!.name = nameController.text;
      selectedTour.value!.description = descriptionController.text;
      selectedTour.value!.date = (dateController.text.isNotEmpty
          ? DateTime.parse(dateController.text).toString()
          : null)!;
      selectedTour.value!.duration = durationController.text;
      selectedTour.value!.location = locationController.text;
      selectedTour.value!.price = priceController.text;

      Get.snackbar(
        "Tour updated",
        "The tour has been updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      tours.refresh();
      clearItem();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      dateController.text =
          pickedDate.toString().substring(0, 10); // Format date as yyyy-MM-dd
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    locationController.dispose();
    dateController.dispose();
    durationController.dispose();

    super.onClose();
  }

  void deleteTour(int id) {
    tours.removeWhere((tour) => tour.id == id);
  }
}
