import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hello_user_l10n/locale_changed_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultLocale = L10n.supportedLocales.first;
    final localeChangedNotifier = LocaleChangeNotifier(defaultLocale);

    return ValueListenableBuilder(
      valueListenable: localeChangedNotifier,
      builder: (context, value, _) => MaterialApp(
        locale: value,
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: _MainPageContent(localeChangedNotifier),
      ),
    );
  }
}

class _MainPageContent extends StatelessWidget {
  const _MainPageContent(this.localeChangeNotifier);

  final LocaleChangeNotifier localeChangeNotifier;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.mainPage_greetings),
            const SizedBox(height: 24),
            DropdownButton(
              value: localeChangeNotifier.value,
              items: L10n.supportedLocales.map((locale) {
                return DropdownMenuItem(
                  value: locale,
                  child: Text(locale.name),
                );
              }).toList(),
              onChanged: localeChangeNotifier.changeAppLanguage,
            ),
          ],
        ),
      ),
    );
  }
}

extension on Locale {
  String get name => switch (languageCode) {
    'en' => 'English',
    'es' => 'España',
    _ => languageCode,
  };
}
