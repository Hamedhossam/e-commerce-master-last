
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static dynamic  getData(String key) {
    return  sharedPreferences!.get(key);
  }

  static Future<dynamic> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);

    if (value is int) return await sharedPreferences!.setInt(key, value);

    if (value is double) return await sharedPreferences!.setDouble(key, value);

    if (value is List<String>) return await sharedPreferences!.setStringList(key, value);



    if(value is bool) return await sharedPreferences!.setBool(key, value);

  }
  static Future<bool>removeData(key)async
  {
    return await sharedPreferences!.remove(key);

  }
  static Future<bool>clearData()async
  {
    print('clear');
    return await sharedPreferences!.clear();

  }
  static dynamic  getList(String key) {
    return  sharedPreferences!.getStringList(key);
  }
  static Future<dynamic> saveList({
    required String key,
    required dynamic value,
})
  async
  {
    if (value is List<String>)

      return await sharedPreferences!.setStringList(key, value);

  }

}
