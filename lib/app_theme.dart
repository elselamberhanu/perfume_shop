import 'package:flutter/material.dart';

class AppColors {
  // Main Background Colors
  static const Color backgroundLight = Color(
    0xFFF7F2FA,
  ); // Light lavender-white background
  static const Color surfaceWhite = Colors.white;

  // Primary Colors
  static const Color primaryPurple = Color(
    0xFF5E5791,
  ); // Main purple for text, buttons
  static const Color secondaryBerry = Color(
    0xFF7B5265,
  ); // Berry pink for labels, hearts
  static const Color mutedGrayPurple = Color(
    0xFF5F5C71,
  ); // Muted gray-purple for secondary text

  // Accent & Border Colors
  static const Color lightLavender = Color(
    0xFFC7BFFF,
  ); // Light lavender for borders
  static const Color softLavender = Color(
    0xFFE5DEFF,
  ); // Soft lavender for gradients
  static const Color softPink = Color(0xFFFFD8E7); // Soft pink for Black Opium
  static const Color softLavenderBg = Color(
    0xFFE5DFF9,
  ); // Soft lavender background

  // Perfume Specific Accent Colors
  static const Color shalimarAccent = Color(0xFF5E5791); // Main purple
  static const Color jadoreAccent = Color(0xFF7B5265); // Berry pink
  static const Color chanceAccent = Color(0xFFC7BFFF); // Light lavender
  static const Color blackOpiumAccent = Color(0xFFFFD8E7); // Soft pink
  static const Color aquaUniversalisAccent = Color(
    0xFF5F5C71,
  ); // Muted gray-purple
  static const Color missDiorAccent = Color(0xFFE5DEFF); // Light purple-white
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundLight,
      fontFamily: 'Georgia',
      useMaterial3: true,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryPurple,
        secondary: AppColors.secondaryBerry,
        tertiary: AppColors.lightLavender,
        background: AppColors.backgroundLight,
        surface: AppColors.surfaceWhite,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: AppColors.mutedGrayPurple,
        onSurface: AppColors.mutedGrayPurple,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.primaryPurple,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        ),
        iconTheme: IconThemeData(color: AppColors.primaryPurple),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPurple,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.primaryPurple,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          color: AppColors.primaryPurple,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: AppColors.primaryPurple,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: AppColors.mutedGrayPurple,
          fontSize: 15,
          height: 1.5,
        ),
        bodyMedium: TextStyle(color: AppColors.mutedGrayPurple, fontSize: 13),
        labelSmall: TextStyle(
          color: AppColors.secondaryBerry,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
        ),
      ),

      cardTheme: const CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        color: AppColors.surfaceWhite,
      ),
    );
  }

  // Common gradients used throughout the app
  static const LinearGradient categoryGradient = LinearGradient(
    colors: [AppColors.primaryPurple, AppColors.secondaryBerry],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.softLavender, AppColors.backgroundLight],
  );

  static const LinearGradient toggleGradient = LinearGradient(
    colors: [AppColors.primaryPurple, AppColors.lightLavender],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Common box shadows
  static BoxShadow get softShadow => BoxShadow(
    color: AppColors.primaryPurple.withOpacity(0.08),
    blurRadius: 12,
    offset: const Offset(0, 4),
  );

  static BoxShadow get cardShadow => BoxShadow(
    color: AppColors.primaryPurple.withOpacity(0.08),
    blurRadius: 12,
    offset: const Offset(0, 4),
  );

  static BoxShadow get circleShadow => BoxShadow(
    color: AppColors.primaryPurple.withOpacity(0.1),
    blurRadius: 8,
    offset: const Offset(0, 0),
  );

  static BoxShadow get largeCircleShadow => BoxShadow(
    color: AppColors.primaryPurple.withOpacity(0.2),
    blurRadius: 30,
    offset: const Offset(0, 8),
  );

  // Common decorative styles
  static BoxDecoration get tagDecoration => BoxDecoration(
    color: AppColors.primaryPurple.withOpacity(0.1),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: AppColors.lightLavender),
  );

  static BoxDecoration get priceTagDecoration => BoxDecoration(
    color: AppColors.primaryPurple.withOpacity(0.1),
    borderRadius: BorderRadius.circular(12),
  );

  static BoxDecoration get sizeButtonDecorationSelected => BoxDecoration(
    color: AppColors.primaryPurple,
    borderRadius: BorderRadius.circular(12),
  );

  static BoxDecoration get sizeButtonDecorationUnselected => BoxDecoration(
    color: AppColors.surfaceWhite,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: AppColors.lightLavender),
  );
}
