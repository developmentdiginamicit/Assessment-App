import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final GetStorage storage = GetStorage();
  void setUserId({String? userId}) {
    storage.write("userId", userId);
  }

  void setToken({required String token}) {
    storage.write("userToken", token);
  }

  String getUserId() {
    return storage.read("userId") ?? "";
  }

  String getToken() {
    return storage.read("userToken") ?? "";
  }

  void deleteAllLocalData() {
    debugPrint("Deleting all local data....");
    storage.erase();
  }
}
