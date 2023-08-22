import 'package:shared_preferences/shared_preferences.dart';

import '../logger/app_logger.dart';

class PreferencesUtil {
  final SharedPreferences preferences;
  final AppLogger logger;

  PreferencesUtil({required this.preferences, required this.logger});

  getPreferencesData(String key) {
    return preferences.get(key) ?? "";
  }

  getBoolPreferencesData(String key) {
    return preferences.get(key) ?? false;
  }

  setPreferencesData(String key, String? value) {
    logger.i('$runtimeType   setPreferencesData KEY: $key');
    logger.i('$runtimeType   setPreferencesData VALUE: $value');
    preferences.setString(key, value ?? "");
  }

  setBoolPreferencesData(String key, bool? value) {
    logger.i('$runtimeType   setBoolPreferencesData KEY: $key');
    logger.i('$runtimeType   setBoolPreferencesData VALUE: $value');
    preferences.setBool(key, value ?? false);
  }

  Future clearPreferencesData() async {
    await preferences.clear();
  }
}