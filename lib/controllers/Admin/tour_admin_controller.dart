import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/tour_model.dart';
import 'package:myapp/utils/string_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TourAdminController extends GetxController {
   Rx<List<Tour>> tours = Rx<List<Tour>>([]);

    final SupabaseClient client = Supabase.instance.client;

  var selectedTour = Rxn<Tour>();
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var locationController = TextEditingController();
  var dateController = TextEditingController();
  var durationController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getTours();
  }


 getTours() async {

    var res = await client.from('tours').select('*');


    tours.value.clear();

    for (var element in res) {
      tours.value = [
        ...tours.value,
        Tour.fromJson(element),
      ];
    }

    tours.refresh();
  }


  void addTour() async {
    var newTour = Tour(
      id: tours.value.length + 1,
      currency: "COP",
      name: nameController.text,
      image: "https://picsum.photos/400/200",
      date: (dateController.text.isNotEmpty
          ? DateTime.parse(dateController.text).toString()
          : null)!,
      description: descriptionController.text,
      duration: durationController.text,
      location: locationController.text,
      price: priceController.text.toDouble(),
    );
    tours.value.add(newTour);
    tours.refresh();
    

   await client.from('tours').insert(newTour.toJson());

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
    priceController.text = item.price.toString();
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

  void updateSelectedItem() async  {
    if (selectedTour.value != null) {
      Get.back(); // Close the editing form
      selectedTour.value!.name = nameController.text;
      selectedTour.value!.description = descriptionController.text;
      selectedTour.value!.date = (dateController.text.isNotEmpty
          ? DateTime.parse(dateController.text).toString()
          : null)!;
      selectedTour.value!.duration = durationController.text;
      selectedTour.value!.location = locationController.text;
      selectedTour.value!.price = priceController.text.toDouble();

      await client.from('tours').update(selectedTour.value!.toJson()).eq('id', selectedTour.value!.id);

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

  void deleteTour(int id) async {
    tours.value.removeWhere((tour) => tour.id == id);

   await client.from('tours').delete().eq('id', id);

    Get.snackbar(
      "Tour deleted",
      "The tour has been deleted successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    tours.refresh();
  }
}
