import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesController extends GetxController {
  RxMap favorites = {}.obs;

  final SupabaseClient client = Supabase.instance.client;

  getAllFavorites() async {
    favorites.clear();
    final res = await client.from('favorites').select('*');
    for (var element in res) {
      favorites.assign(element['tour_id'], true);
    }
  }

  getFavorite(String tourId) {
    print('getFavorite ${favorites[tourId]}');

    return favorites[tourId];
  }

  setFavorite(String tourId, String userId) async {
    favorites[tourId] = true;
    await client
        .from('favorites')
        .insert({'tour_id': tourId, 'user_id': userId});
  }

  void deleteFavorite(String tourId, String userId) async {
    favorites[tourId] = false;
    await client
        .from('favorites')
        .delete()
        .eq('tour_id', tourId)
        .eq('user_id', userId);
  }

  @override
  void onInit() {
    getAllFavorites();
    super.onInit();
  }
}
