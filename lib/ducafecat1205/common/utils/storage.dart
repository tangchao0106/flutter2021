import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  StorageUtil._internal(); //内部的
  static final StorageUtil _instance = StorageUtil._internal();

  factory StorageUtil() {
    return _instance;
  }

  late SharedPreferences _preferences;

  Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setJSON(String key, dynamic jaonVal) {
    String jsonString = jsonEncode(jaonVal);
    return _preferences.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String? string = _preferences.getString(key);
    return string == null ? null : jsonDecode(string);
  }

  Future<bool> setBool(String key, bool val) {
    return _preferences.setBool(key, val);
  }

  bool getBool(String key) {
    bool? val = _preferences.getBool(key);
    return val == null ? false : val;
  }

  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }
}
