import 'package:get/get.dart';
import 'package:myapp/controllers/User/user_controller.dart';
import 'package:myapp/models/tour_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TourSingleController extends GetxController {
   final Rx<Tour> tour = Tour(
    id: 0,
    name: "",
    description: "",
    price: 0,
    image: "",
    date: DateTime.now().toIso8601String(),
    location: "",
    duration: '',
    currency: 'COP'
   ).obs;

  RxBool isBooked = false.obs;
  RxBool isLoading = false.obs;

  UserController userController = Get.put(UserController());

  final SupabaseClient client = Supabase.instance.client;

  getTour(tourId) async {
    return await client.from('tours').select('*').eq('id', tourId).single();
  }

  countIsBooking(tourId) async {
    var res = await client
        .from('bookings')
        .select('*')
        .eq('tour_id', tourId)
        .eq('user_id', userController.user?.id ?? "")
        .count();

    return res.count;
  }

  getSingleTour() async {
    isLoading.value = true;
    isBooked.value = false;
    String? tourId = Get.parameters['tourId'] ?? "";

    if (tourId.isNotEmpty) {
      var resBooking = await countIsBooking(tourId);
      if (resBooking > 0) {
        isBooked.value = true;
      }
      var res = await getTour(tourId);
      tour.value = Tour.fromJson(res);
      tour.refresh();
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    await getSingleTour();
    super.onInit();
  }
}
