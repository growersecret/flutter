import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getBool(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false;
}


