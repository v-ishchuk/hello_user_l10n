import 'package:flutter/material.dart';
import 'package:hello_user_l10n/repositories/user_preferences.dart';
import 'package:hello_user_l10n/supported_language.dart';

class LocaleController extends ChangeNotifier {
  LocaleController({
    required UserPreferencesRepository userPreferencesRepository,
  }) : _userPreferencesRepository = userPreferencesRepository;

  final UserPreferencesRepository _userPreferencesRepository;

  SupportedLanguage _selectedLanguage = SupportedLanguage.english;

  SupportedLanguage get selectedLanguage => _selectedLanguage;

  Set<SupportedLanguage> get supportedLanguages =>
      SupportedLanguage.values.toSet();

  Future<void> init() async {
    _selectedLanguage = await _userPreferencesRepository.readUserLanguage();

    notifyListeners();
  }

  Future<void> changeAppLanguage(SupportedLanguage? language) async {
    if (language == null || language == _selectedLanguage) {
      return;
    }

    await _userPreferencesRepository.storeUserLanguage(language);

    _selectedLanguage = language;

    notifyListeners();
  }
}
