import 'package:flutter/material.dart';
import 'browse_page.dart';
import 'language_provider.dart';
import 'app_theme.dart';

void main() {
  runApp(const PerfumeShopApp());
}

class PerfumeShopApp extends StatelessWidget {
  const PerfumeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = LanguageProvider();

    return LanguageScope(
      notifier: provider,
      child: MaterialApp(
        title: 'Perfume Shop',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme, // Using centralized theme
        home: const BrowsePage(),
      ),
    );
  }
}
