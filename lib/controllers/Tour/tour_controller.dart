
import 'package:get/get.dart';
import 'package:myapp/models/tour_model.dart';

class TourController extends GetxController {
  List<Tour> tours = [];

  getTours() async {
    tours = [
      Tour(
          id: "1",
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
          id: "2",
          currency: "COP",
          name: "turpis in eu mi bibendum neque egestas congue quisque",
          image: "https://picsum.photos/400/200",
          date: "2021-10-10",
          description:
              "lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean et tortor at risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque",
          duration: "2",
          location: "San Juan del Cesar",
          price: "360000")
    ];
  }

  navigateSinglertour(String tourId) {
    Get.toNamed("/tour/$tourId");
  }

  getSingleTour(){
    String? tourId = Get.parameters['tourId'] ?? "";
    if (tourId.isNotEmpty) {
    return tours.firstWhere((element) => element.id == tourId);
    }
    return null;
  }

  @override
  void onInit() {
    getTours();
    super.onInit();
  }
}
