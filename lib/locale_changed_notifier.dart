import 'package:flutter/material.dart';

class LocaleChangeNotifier extends ValueNotifier<Locale> {
  LocaleChangeNotifier(super.value);

  void changeAppLanguage(Locale? locale) {
    if (locale == null || value == locale) {
      return;
    }

    value = locale;
  }
}
