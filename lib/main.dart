import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hello_user_l10n/locale_controller.dart';
import 'package:hello_user_l10n/repositories/user_preferences.dart';
import 'package:hello_user_l10n/supported_language.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocaleController>(
      create: (context) => LocaleController(
        userPreferencesRepository: UserPreferencesRepositoryImpl(),
      ),
      child: Consumer<LocaleController>(
        builder: (context, controller, _) => _RootPage(
          localeController: controller,
        ),
      ),
    );
  }
}

class _RootPage extends StatefulWidget {
  const _RootPage({required this.localeController});

  final LocaleController localeController;

  @override
  State<_RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<_RootPage> {
  @override
  void initState() {
    super.initState();
    widget.localeController.init();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.localeController;

    return MaterialApp(
      locale: controller.supportedLanguage.languageLocale,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _GreetingsPageContent(
        supportedLanguage: controller.supportedLanguage,
        onLanguageChanged: controller.changeAppLanguage,
      ),
    );
  }
}

class _GreetingsPageContent extends StatelessWidget {
  const _GreetingsPageContent({
    required this.supportedLanguage,
    required this.onLanguageChanged,
  });

  final SupportedLanguage supportedLanguage;
  final ValueChanged<SupportedLanguage?>? onLanguageChanged;

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
              value: supportedLanguage,
              items: L10n.supportedLocales.map((locale) {
                final language =
                    SupportedLanguage.fromCode(locale.languageCode) ??
                        SupportedLanguage.english;

                return DropdownMenuItem(
                  value: language,
                  child: Text(language.localizedName),
                );
              }).toList(),
              onChanged: onLanguageChanged,
            ),
          ],
        ),
      ),
    );
  }
}
