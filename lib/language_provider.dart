import 'package:flutter/material.dart';

// This class holds the current language state of the app.
// 'ChangeNotifier' means it can alert widgets when something changes.
class LanguageProvider extends ChangeNotifier {
  bool _isAmharic = false;

  bool get isAmharic => _isAmharic;

  // Call this to flip the language. notifyListeners() tells every
  void toggle() {
    _isAmharic = !_isAmharic;
    notifyListeners();
  }
}

class LanguageScope extends InheritedNotifier<LanguageProvider> {
  const LanguageScope({
    super.key,
    required super.notifier,
    required super.child,
  });

  static LanguageProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LanguageScope>()!
        .notifier!;
  }
}
