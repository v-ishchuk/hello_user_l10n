import 'package:hello_user_l10n/supported_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserPreferencesRepository {
  Future<bool> storeUserLanguage(SupportedLanguage language);

  Future<SupportedLanguage> readUserLanguage();
}

class UserPreferencesRepositoryImpl implements UserPreferencesRepository {
  static const _userSupportedLanguageCode = 'userSupportedLanguageCode';

  SharedPreferences? _instance;

  Future<SharedPreferences> _prefs() async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  @override
  Future<SupportedLanguage> readUserLanguage() async {
    final prefs = await _prefs();
    final languageCode = prefs.getString(_userSupportedLanguageCode);

    return SupportedLanguage.fromCode(languageCode) ??
        SupportedLanguage.english;
  }

  @override
  Future<bool> storeUserLanguage(SupportedLanguage language) async {
    final prefs = await _prefs();

    return prefs.setString(_userSupportedLanguageCode, language.locationCode);
  }
}
