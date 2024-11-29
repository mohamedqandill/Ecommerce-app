import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save data in shared preferences
  static Future<bool> saveData<T>(String key, T value) async {
    if (_preferences == null) init();

    if (value is String) {
     return await _preferences!.setString(key, value);
    } else if (value is int) {
     return await _preferences!.setInt(key, value);
    }
    else if (value is bool) {
     return await _preferences!.setBool(key, value);
    } else if (value is double) {
      return await _preferences!.setDouble(key, value);
    } else if (value is List<String>) {
      return await _preferences!.setStringList(key, value);
    } else {
      throw Exception('Invalid type');
    }
  }

  // Retrieve data from shared preferences
  static T? getData<T>(String key)  {
    if (_preferences == null) return null;

    if (T == String) {
      return _preferences!.getString(key) as T?;
    } else if (T == int) {
      return _preferences!.getInt(key) as T?;
    } else if (T == bool) {
      return _preferences!.getBool(key) as T?;
    } else if (T == double) {
      return _preferences!.getDouble(key) as T?;
    } else if (T == List<String>) {
      return _preferences!.getStringList(key) as T?;
    } else {
      throw Exception('Invalid type');
    }
  }

  // Remove a key from shared preferences
  static Future<void> removeData(String key) async {
    if (_preferences == null) return;

    await _preferences!.remove(key);
  }

  // Clear all data from shared preferences
  static Future<void> clear() async {
    if (_preferences == null) return;

    await _preferences!.clear();
  }
}