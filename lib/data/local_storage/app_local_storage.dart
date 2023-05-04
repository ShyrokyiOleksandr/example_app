import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static const _ageKey = "AGE";
  static const _lastUrlKey = "LAST_URL";

  final SharedPreferences _sharedPreferences;

  AppLocalStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  Future<int?> getAge() async {
    return _sharedPreferences.getInt(_ageKey);
  }

  Future<void> storeAge(int age) async {
    await _sharedPreferences.setInt(_ageKey, age);
  }

  Future<String?> getLastUrl() async {
    return _sharedPreferences.getString(_lastUrlKey);
  }

  Future<void> storeUrl(String url) async {
    await _sharedPreferences.setString(_lastUrlKey, url);
  }
}
