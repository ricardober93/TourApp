import 'package:get/get.dart';
import 'package:myapp/controllers/Favorites/favorites_controller.dart';
import 'package:myapp/controllers/User/user_controller.dart';
import 'package:myapp/models/tour_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TourController extends GetxController {
  Rx<List<Tour>> tours = Rx<List<Tour>>([]);


  RxBool isBooked = false.obs;
  FavoritesController favoriteController = Get.put(FavoritesController());
  UserController userController = Get.put(UserController());

  final SupabaseClient client = Supabase.instance.client;

  get tour => null;

  getTours() async {
    var res = await client.from('tours').select('*');

    tours.value.clear();

    for (var element in res) {
      tours.value.add(Tour.fromJson(element));
    }

    tours.refresh();
  }

  navigateSinglertour(int tourId) {
    Get.toNamed("/tour/${tourId.toString()}");
  }

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
    isBooked.value = false;
    String? tourId = Get.parameters['tourId'] ?? "";

    if (tourId.isNotEmpty) {
      var resBooking = await countIsBooking(tourId);
      if (resBooking > 0) {
        isBooked.value = true;
      }
      var res = await getTour(tourId);
      return Tour.fromJson(res);
    }

    return null;
  }

  @override
  void onInit() {
    getTours();
    super.onInit();
  }

  void favorited(int tourId) async {
    final userId = userController.user?.id ?? "";
    final isFavorite = favoriteController.isFavorite(tourId);

    if (userId.isNotEmpty && !isFavorite) {
      favoriteController.setFavorite(tourId, userId);
    }
    if (userId.isNotEmpty && isFavorite) {
      favoriteController.deleteFavorite(tourId, userId);
    }
  }
}
