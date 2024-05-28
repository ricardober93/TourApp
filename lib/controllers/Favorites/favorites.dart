import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesController extends GetxController {
   var favorites = {}.obs;

  final SupabaseClient client = Supabase.instance.client;

  getAllFavorites() async {

    final res = await client.from('favorites').select('*');
   
    for (var item in res) {
      favorites[item['tour_id']] = true;
    }

    favorites.refresh();
  }



  setFavorite( tourId, String userId) async {
    favorites[tourId] = true;
    await client
        .from('favorites')
        .insert({'tour_id': tourId, 'user_id': userId});
  }

  void deleteFavorite( tourId, String userId) async {
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

  bool isFavorite(int id) {
    return favorites[id] ?? false;
  }
}
