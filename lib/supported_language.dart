import 'dart:ui';

const _englishLocationCode = 'en';
const _spanishLocationCode = 'es';

enum SupportedLanguage {
  english,
  spanish;

  static SupportedLanguage? fromCode(String? locationCode) {
    return switch (locationCode) {
      _englishLocationCode => SupportedLanguage.english,
      _spanishLocationCode => SupportedLanguage.spanish,
      _ => null,
    };
  }

  String get locationCode => switch (this) {
        SupportedLanguage.english => _englishLocationCode,
        SupportedLanguage.spanish => _spanishLocationCode,
      };

  Locale get languageLocale => switch (this) {
        SupportedLanguage.english => const Locale(_englishLocationCode),
        SupportedLanguage.spanish => const Locale(_spanishLocationCode),
      };

  String get localizedName => switch (this) {
        SupportedLanguage.english => 'English',
        SupportedLanguage.spanish => 'España',
      };
}
