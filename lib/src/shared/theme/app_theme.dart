import 'package:flutter/material.dart';

/// Centralized application theme for Nexus English.
/// Refactored to match the dashboard design (design/dashboard.png):
/// - Primary color: natural forest green
/// - Background: very light gray
/// - Cards: white with soft shadow and rounded corners
/// - Text: dark gray / near black
/// Uses Material 3 (useMaterial3: true)
class AppTheme {
  // Color roles used across the theme. Using named constants keeps colors
  // consistent and makes it easy to change the palette in one place.
  static const Color _primaryForest = Color(0xFF2F7A5E); // forest green
  static const Color _onPrimary = Colors.white;
  static const Color _bgVeryLight = Color(0xFFF6F7F8); // very light gray
  static const Color _surface = Colors.white; // cards and surfaces
  static const Color _onSurface = Color(0xFF0F1720); // near-black for text
  static const Color _mutedGray =
      Color(0xFF6B7280); // for unselected icons/text
  static const Color _chipBg = Color(0xFFEAF6F0); // soft green tint for chips
  static const double _cardRadius = 18.0;

  /// Light theme matching the dashboard mock.
  /// Kept as a static method so existing call sites can use `AppTheme.lightTheme()`.
  static ThemeData lightTheme() {
    // Create a ColorScheme based on our primary color to ensure consistent
    // color roles (primary, secondary, background, surface, etc.).
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: _primaryForest,
      brightness: Brightness.light,
      primary: _primaryForest,
      onPrimary: _onPrimary,
      surface: _surface,
      onSurface: _onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      // Scaffold background is a very light gray to match the dashboard canvas.
      scaffoldBackgroundColor: _bgVeryLight,

      // AppBar: white background, no elevation, centered title per spec.
      appBarTheme: AppBarTheme(
        backgroundColor: _surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: _onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          // Keep fontFamily configurable in the project; use system fallback.
        ),
        iconTheme: const IconThemeData(color: _onSurface),
      ),

      // Card styles: white surface, soft shadow, rounded corners.
      cardTheme: CardThemeData(
        color: _surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),

      // Elevated buttons: green background, white text, rounded corners (12).
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // Outlined buttons: green border, green text
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          // Use withAlpha to avoid precision-loss deprecation for opacity.
          side: BorderSide(
              color: colorScheme.primary.withAlpha((0.9 * 255).round())),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),

      // Floating action button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),

      // Navigation Bar (Material 3) for bottom navigation: white background,
      // selected = green, unselected = muted gray.
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: _surface,
        // Use withAlpha for subtle indicator tint.
        indicatorColor: colorScheme.primary.withAlpha((0.12 * 255).round()),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
            color: states.contains(WidgetState.selected)
                ? colorScheme.primary
                : _mutedGray,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            size: 22,
            color: states.contains(WidgetState.selected)
                ? colorScheme.primary
                : _mutedGray,
          ),
        ),
      ),

      // Chips / status badges: pill shape with soft backgrounds.
      chipTheme: ChipThemeData(
        backgroundColor: _chipBg,
        selectedColor: colorScheme.primary.withAlpha((0.12 * 255).round()),
        disabledColor: Colors.grey.shade200,
        labelStyle:
            const TextStyle(color: _onSurface, fontWeight: FontWeight.w600),
        secondaryLabelStyle: const TextStyle(color: _onSurface),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),

      // Progress indicators
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearMinHeight: 6,
        circularTrackColor: Colors.grey.shade200,
      ),

      // Bottom sheet, dialog surface etc should use same white surface tone
      dialogTheme: DialogThemeData(
        backgroundColor: _surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // Typography: use system fonts but keep strong hierarchy for headings.
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: _onSurface, fontSize: 28, fontWeight: FontWeight.w700),
        headlineLarge: TextStyle(
            color: _onSurface, fontSize: 22, fontWeight: FontWeight.w700),
        titleLarge: TextStyle(
            color: _onSurface, fontSize: 18, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: _onSurface, fontSize: 16),
        bodyMedium: TextStyle(color: _onSurface, fontSize: 14),
        labelLarge:
            TextStyle(color: colorScheme.primary, fontWeight: FontWeight.w600),
      ),

      // Small visual tweaks
      dividerColor: Colors.grey.shade200,
      cardColor: _surface,
    );
  }
}
