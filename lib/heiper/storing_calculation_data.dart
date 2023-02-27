import 'package:shared_preferences/shared_preferences.dart';

// Save string to SharedPreferences
Future<void> saveString(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

// Retrieve string from SharedPreferences
Future getString(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? '';
}

deleteText(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}
