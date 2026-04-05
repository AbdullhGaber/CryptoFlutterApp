import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  final SharedPreferences _prefs;

  SharedPrefsManager(this._prefs);

  static const String _onboardingKey = 'has_seen_onboarding';

  Future<void> setOnboardingSeen() async {
    await _prefs.setBool(_onboardingKey, true);
  }

  bool hasSeenOnboarding() {
    return _prefs.getBool(_onboardingKey) ?? false;
  }
}