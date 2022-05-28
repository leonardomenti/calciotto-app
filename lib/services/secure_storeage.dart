import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> writeSecureData(String k, String v) async {
    await _secureStorage.write(key: k, value: v);
  }

  Future<String> readSecureData(String key) async {
    String value = "";
    try {
      value = (await _secureStorage.read(key: key)) ?? "";
    } catch (e) {
      print(e);
    }
    return value;
  }
  Future deleteSecureData(String key) async{
    var deleteData = await _secureStorage.delete(key: key);
    return deleteData;
  }

}