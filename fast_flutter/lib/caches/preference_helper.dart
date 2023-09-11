import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper{

  PreferenceHelper._();

  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<void> put(String key, Object value) async {
    var prefs = await _prefs;
    if (value is String) {
      prefs.setString(key, value);
    }
    if (value is int) {
      prefs.setInt(key, value);
    }
    if (value is bool) {
      prefs.setBool(key, value);
    }
    if (value is double) {
      prefs.setDouble(key, value);
    }
  }

  static Future<String> getString(String key, {String def = ""}) async {
    var prefs = await _prefs;
    return prefs.getString(key)?? def;
  }

  static Future<int> getInt(String key, {int def = 0}) async {
    var prefs = await _prefs;
    return prefs.getInt(key) ?? def;
  }
}