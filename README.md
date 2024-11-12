# hello_user_l10n

A new Flutter project.

### My comments:

To implement this one-screen task, I decided to use a simple `ValueNotifier` as it has several
advantages:
- It’s built-in, so there’s no need to add external dependencies.
- It has a straightforward interface, making it easy to understand and use.

Although a `StatefulWidget` could also handle this, using `ValueNotifier` allows the
language-selection screen to remain modular and independent, making it reusable elsewhere if needed.

Please note that this example does not store the chosen language. To implement persistence, we would
need to save the selection in `SharedPreferences`, a local database, or potentially in the cloud.

In a more complex project with multiple screens, I would create a controller
extending `ChangeNotifier` and use a state management solution like `Provider` to propagate the
controller instance throughout the app. This would enable a scalable, centralized state for managing
the app locale.

For advanced localization needs, a custom `LocalizationsDelegate` could be implemented to handle
multiple language configurations, as well as specific locale overrides for individual widgets or
screens.