import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServices {
  // Private constructor to ensure only one instance
  SharedPreferenceServices._privateConstructor() {
    init();
  }

  // Singleton instance
  static final SharedPreferenceServices _instance =
      SharedPreferenceServices._privateConstructor();

  // Factory constructor to return the same instance
  factory SharedPreferenceServices() {
    return _instance;
  }

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setVariable(String variable) async {
    await _prefs.setString("variable", variable);
  }

  Future<String> getVariable() async {
    String variable = await _prefs.getString("variable") ?? "hello";
    return variable;
  }
}
