import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences(SharedPreferences prefs) : _prefs = prefs;

  final SharedPreferences _prefs;

  Future<bool> saveString({required String key, required String value}) =>
      _prefs.setString(key, value);

  String getString({required String key, String defaultValue = ''}) =>
      _prefs.getString(key) ?? defaultValue;

  Future<bool> saveBool({required String key, required bool value}) => _prefs.setBool(key, value);
  
  bool getBool({required String key, bool defaultValue = false}) =>
      _prefs.getBool(key) ?? defaultValue;

  Future<bool> removeValue(String key) => _prefs.remove(key);
  
  Future<bool> clear() => _prefs.clear();
}
