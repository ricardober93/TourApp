import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/User/user_controller.dart';
import 'package:myapp/models/booking_model.dart';
import 'package:myapp/utils/string_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookingController extends GetxController {
  final SupabaseClient client = Supabase.instance.client;
  UserController userController = Get.put(UserController());
  
  RxList<Booking> bookings = <Booking>[].obs;


  var dateController = TextEditingController();
  var numberPeopleController = TextEditingController(text: '1');
  var totalPriceController = TextEditingController();

  @override
  void onInit() {
    getAllBookings();
    super.onInit();
  }
  

    @override
  void onClose() {
    dateController.dispose();
    numberPeopleController.dispose();
    totalPriceController.dispose();

    super.onClose();
  }



  getAllBookings() async {

    var userId = userController.user?.id;
    var res = await client
        .from('bookings')
        .select('*, tours(*)')
        .eq('user_id', userId!);

        print(res);

 bookings.clear();
 
      for (var book in res) {
        bookings.add(Booking.fromJson(book));
      }

      bookings.refresh();
  }

  Future<Booking> getBooking(tourId) async {
    var userId = userController.user?.id;
    var res = await client
        .from('bookings')
        .select('*')
        .eq('tour_id', tourId)
        .eq('user_id', userId!)
        .single();

    Booking bookingModel = Booking.fromJson(res);
    return bookingModel;
  }



  setBooking(tourId) {
    var userId = userController.user?.id;
    return client
        .from('bookings')
        .insert({'tour_id': tourId, 'user_id': userId});
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
    if (pickedDate != null) {
      dateController.text =
          pickedDate.toString().substring(0, 10); // Format date as yyyy-MM-dd
    }
  }


  void clearItem() {
    numberPeopleController.clear();
    totalPriceController.clear();
    dateController.clear();
  }

  calculateTotalPrice(totalPrice) {
    if (numberPeopleController.text.isNotEmpty) {
      totalPriceController.text =
          (int.parse(numberPeopleController.text) * totalPrice).toString().split('.')[0];
    }

    if (totalPriceController.text.isEmpty || totalPriceController.text == '0') {
      totalPriceController.text = '1';
    }
  }

  void createBooking(tourId) async {
    var userId = userController.user?.id;
    var id = tourId;
    var date = dateController.text;
    var numberPeople = numberPeopleController.text;
    var totalPrice = totalPriceController.text;

    await client.from('bookings').insert({
      'date': DateTime.parse(date).toIso8601String(),
      'num_people': numberPeople.toNumber(),
      'total_price': totalPrice.toNumber(),
      'tour_id': id,
      'user_id': userId,
      'status': 'pending',
    });

    Get.back();
    clearItem();
    Get.snackbar('Success', 'Booking success!', backgroundColor: Colors.green);
  }
}
