# hello_user_l10n

A new simple flutter project.

### My comments:

Implemented a simple localization feature for language switching. The selected locale is stored in
`SharedPreferences` to retain the user’s choice between sessions.

For advanced localization needs, a custom `LocalizationsDelegate` could be implemented to handle
multiple language configurations, as well as specific locale overrides for individual widgets or
screens.

To manage language selection, I created a custom enum, `SupportedLanguage`, instead of using
Flutter’s `Locale` class directly. This has a few advantages:

- Flexibility: `SupportedLanguage` makes it easy to add or modify languages without affecting other
  parts of the app.
- Easy mapping: The enum includes helper methods to map to language codes, which simplifies storing
  and retrieving language settings, even from the cloud.
- Centralized Language Details: Getters like `locationCode`, `languageLocale`, and `localizedName`
  provide easy access to the `Locale` details like: code, name for each language in one place.

This enum approach keeps language management clean, flexible, and easy to work with across the app. 