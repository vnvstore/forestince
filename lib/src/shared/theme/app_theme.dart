import 'package:flutter/material.dart';

/// Centralized application theme for Nexus English.
/// Place additional theme variants (dark, compact, etc.) here later.
class AppTheme {
  static ThemeData originalTheme() {
    return ThemeData(
      useMaterial3: true,
      // AppBar: transparent, no elevation for the clean & airy look
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      brightness: Brightness.light,
      // Color palette tuned for education: Indigo primary, Amber accent, Off-White background
      colorScheme: const ColorScheme.light(
        surface: Color(0xFFF8F9FA), // Off-white as the primary surface
        onSurface: Color(0xff090A0A),
        primary: Color(0xFF3F51B5), // Indigo
        onPrimary: Color(0xffffffff),
        secondary: Color(0xFFFFC107), // Amber accent
        tertiary: Color(0xffE9E7E1),
        onTertiary: Color(0xff979C9E),
        primaryContainer: Color(0xffFFFFFF),
      ),
      scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      // Card appearance: rounded cards (16-24dp) for friendly EdTech vibe
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff317C7D),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xff317C7D),
          side: const BorderSide(color: Color(0xff317C7D)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff317C7D),
        foregroundColor: Colors.white,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        // Amber indicator with ~14% opacity (0x24 ≈ 14%) to be subtle
        indicatorColor: const Color(0x24FFC107),
        labelTextStyle: WidgetStatePropertyAll(const TextStyle(fontSize: 12)),
        iconTheme: WidgetStatePropertyAll(const IconThemeData(size: 22)),
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xff317C7D),
        linearMinHeight: 4,
      ),
      // Typography: Montserrat/Poppins for headings; Inter/Roboto for body.
      // Note: ensure these fonts are included (pubspec.yaml or google_fonts) for exact results.
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontFamily: 'Montserrat', fontSize: 24, fontWeight: FontWeight.w700),
        titleLarge: TextStyle(fontFamily: 'Montserrat', fontSize: 18, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(fontFamily: 'Inter', fontSize: 16),
        bodyMedium: TextStyle(fontFamily: 'Inter', fontSize: 16), // keep body at least 16sp
      ),
    );
  }
}
