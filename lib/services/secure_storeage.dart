import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> writeSecureData(String k, String v) async {
    await _secureStorage.write(key: k, value: v);
  }

}