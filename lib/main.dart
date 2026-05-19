import 'package:flutter/material.dart';
import 'browse_page.dart';
import 'language_provider.dart';

void main() {
  runApp(const PerfumeShopApp());
}

class PerfumeShopApp extends StatelessWidget {
  const PerfumeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    // We create ONE instance of LanguageProvider here at the top.
    // LanguageScope wraps the entire MaterialApp so every screen
    // below it can access and listen to language changes.
    final provider = LanguageProvider();

    return LanguageScope(
      notifier: provider,
      child: MaterialApp(
        title: 'Perfume Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFDF0F0),
          fontFamily: 'Georgia',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFB07070),
            background: const Color(0xFFFDF0F0),
          ),
          useMaterial3: true,
        ),
        home: const BrowsePage(),
      ),
    );
  }
}
