import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  Future<void> write(String key, Map<String, dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }
// changes
  Map<String, dynamic>? read(String key) {
    final prefs = SharedPreferences.getInstance();
    final data = prefs.then((prefs) => prefs.getString(key));
    // ignore: unnecessary_null_comparison
    return data != null
        ? jsonDecode(data as String) as Map<String, dynamic>
        : null;
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
