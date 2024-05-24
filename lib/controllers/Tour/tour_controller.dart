import 'package:get/get.dart';
import 'package:myapp/models/tour_model.dart';
import 'package:myapp/utils/string_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TourController extends GetxController {
  Rx<List<Tour>> tours = Rx<List<Tour>>([]);

  final SupabaseClient client = Supabase.instance.client;

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

  getSingleTour() {
    String? tourId = Get.parameters['tourId'] ?? "";

    if (tourId.isNotEmpty) {
      return tours.value
          .firstWhere((element) => element.id == tourId.toNumber());
    }
    return null;
  }

  @override
  void onInit() {
    getTours();
    super.onInit();
  }
}
