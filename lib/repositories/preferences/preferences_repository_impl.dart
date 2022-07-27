import 'dart:ui';
import 'package:ingatlan_figyelo_teszt/repositories/preferences/preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  static const String _localeLanguageCodeKey = 'localeLanguageCode';

  @override
  Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_localeLanguageCodeKey, locale.languageCode);
  }

  @override
  Future<Locale> get locale async {
    final prefs = await SharedPreferences.getInstance();

    final languageCode = prefs.getString(_localeLanguageCodeKey);

    if (languageCode != null) {
      return Locale.fromSubtags(
        languageCode: languageCode,
      );
    }

    return const Locale(_localeLanguageCodeKey);
  }
}
