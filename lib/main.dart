import 'package:flutter/material.dart';
import 'browse_page.dart';

void main() {
  runApp(const PerfumeShopApp());
}

class PerfumeShopApp extends StatelessWidget {
  const PerfumeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfume Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDF0F0),
        fontFamily: 'Georgia',
        useMaterial3: true,
      ),
      home: const BrowsePage(),
    );
  }
}
