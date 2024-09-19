import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {

  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  //to set data to sharedpref
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    return await sharedPreferences.setStringList(key, value);
  }

  //get data from sharedpref
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //remove specific entry from shared pref
  static removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //contain sharedpref
  static containsKey({required String key}) {
    return  sharedPreferences.containsKey(key);
  }

  //clear all data in sharedpref
  static Future<bool> clear() async {
    return await sharedPreferences.clear();
  }
}