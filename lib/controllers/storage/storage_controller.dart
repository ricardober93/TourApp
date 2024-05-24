import 'package:get/get.dart';
import 'package:myapp/services/storage_services.dart';

class StorageController extends GetxController {
  final StorageService storageService = StorageService();

  void saveData(String key, String value) {
    storageService.write(key, value);
  }

  readData(String key) {
    return storageService.read<String>(key) ?? 'No Data';
  }

  void deleteData(String key) {
    storageService.remove(key);
  }
}
