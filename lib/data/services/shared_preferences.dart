import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }
  //===============================================================

  static Future<bool> setBoolean(
      {required String key, required bool value}) async {
    return await prefs.setBool(key, value);
  }

  //===============================================================

  static dynamic getString({required String key}) => prefs.getString(key);
  

  //===============================================================

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await prefs.setString(key, value);
    if (value is int) return await prefs.setInt(key, value);
    if (value is bool) return await prefs.setBool(key, value);
    return await prefs.setDouble(key, value);
  }

//===============================================================
  static Future<bool> removeData({required String key}) async {
    return await prefs.remove(key);
  }
}
