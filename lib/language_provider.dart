import 'package:flutter/material.dart';

// This class holds the current language state of the app.
// 'ChangeNotifier' means it can alert widgets when something changes.
class LanguageProvider extends ChangeNotifier {
  bool _isAmharic = false; // false = English, true = Amharic

  // A getter so other files can read the current language
  bool get isAmharic => _isAmharic;

  // Call this to flip the language. notifyListeners() tells every
  // widget that is 'listening' to rebuild itself with the new language.
  void toggle() {
    _isAmharic = !_isAmharic;
    notifyListeners();
  }
}

// This is a helper widget that sits at the top of the app and makes
// the LanguageProvider accessible to every screen below it.
class LanguageScope extends InheritedNotifier<LanguageProvider> {
  const LanguageScope({
    super.key,
    required super.notifier,
    required super.child,
  });

  // This static method lets any widget call LanguageScope.of(context)
  // to get the provider from anywhere in the app.
  static LanguageProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LanguageScope>()!
        .notifier!;
  }
}
