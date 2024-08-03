import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Singleton instance
  static final SharedPreferencesHelper _instance = SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper()
  {
    return _instance;
  }

  SharedPreferencesHelper._internal();

  SharedPreferences? _prefs;

  // Initialize SharedPreferences
   Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save a string value
  Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // Retrieve a string value
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  // Save an integer value
  Future<void> saveInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  // Retrieve an integer value
  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  // Save a boolean value
  Future<void> saveBool(String key, bool value) async {
    print(value);
    await _prefs?.setBool(key, value);
  }

  // Retrieve a boolean value
  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  // Remove a value
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }
}
