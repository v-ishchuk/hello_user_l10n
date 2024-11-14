import 'package:flutter/material.dart';
import 'package:hello_user_l10n/repositories/user_preferences.dart';
import 'package:hello_user_l10n/supported_language.dart';

class LocaleController extends ChangeNotifier {
  LocaleController({
    required UserPreferencesRepository userPreferencesRepository,
  }) : _userPreferencesRepository = userPreferencesRepository;

  final UserPreferencesRepository _userPreferencesRepository;

  SupportedLanguage _supportedLanguage = SupportedLanguage.english;

  SupportedLanguage get supportedLanguage => _supportedLanguage;

  Future<void> init() async {
    _supportedLanguage = await _userPreferencesRepository.readUserLanguage();

    notifyListeners();
  }

  Future<void> changeAppLanguage(SupportedLanguage? language) async {
    if (language == null || language == _supportedLanguage) {
      return;
    }

    await _userPreferencesRepository.storeUserLanguage(language);

    _supportedLanguage = language;

    notifyListeners();
  }
}
