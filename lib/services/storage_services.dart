// lib/services/storage_service.dart
import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _box = GetStorage();

  // Guarda un valor en el almacenamiento
  void write(String key, dynamic value) {
    _box.write(key, value);
  }

  // Lee un valor del almacenamiento
  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  // Elimina un valor del almacenamiento
  void remove(String key) {
    _box.remove(key);
  }

  // Verifica si una clave existe en el almacenamiento
  bool hasData(String key) {
    return _box.hasData(key);
  }
}
