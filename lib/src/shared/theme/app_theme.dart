import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized application theme for Forestince (Taigoa Assignment).
/// Refactored to match the dashboard design:
/// - Primary font: Inter (Google Fonts)
/// - Primary color: Forest green #2F7A5E
/// - Background: Very light gray #F6F7F8
class AppTheme {
  static const Color _primaryForest = Color(0xFF1F6F3A);
  static const Color _onPrimary = Colors.white;
  static const Color _surface = Colors.white;
  static const Color _onSurface = Color(0xFF0F1720);
  static const Color _mutedGray = Color(0xFF6B7280);
  static const Color _chipBg = Color(0xFFEAF6F0);
  static const double _cardRadius = 18.0;

  static const Color borderColor = Color(0xFFF1F5F9);

  static TextStyle appBarTitle = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    height: 24 / 16,
    color: Color(0xFF1F6F3A),
  );

  static ThemeData lightTheme() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: _primaryForest,
      brightness: Brightness.light,
      primary: _primaryForest,
      onPrimary: _onPrimary,
      surface: _surface,
      onSurface: _onSurface,
    );

    // 1. Initialize the base TextTheme
    final baseTextTheme = ThemeData.light().textTheme;

    // 2. Use GoogleFonts to create a TextTheme with the 'Inter' font.
    // This automatically maps Inter to display, headline, title, body, and label styles.
    final interTextTheme = GoogleFonts.interTextTheme(baseTextTheme).copyWith(
      displayLarge: GoogleFonts.inter(
        textStyle: baseTextTheme.displayLarge,
        color: _onSurface,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: GoogleFonts.inter(
        textStyle: baseTextTheme.headlineLarge,
        color: _onSurface,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.inter(
        textStyle: baseTextTheme.titleLarge,
        color: _onSurface,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.inter(
        textStyle: baseTextTheme.bodyLarge,
        color: _onSurface,
      ),
      bodyMedium: GoogleFonts.inter(
        textStyle: baseTextTheme.bodyMedium,
        color: _onSurface,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: Color(0xFFFAFAFA),

      // 3. Set the default FontFamily for the entire application
      fontFamily: GoogleFonts.inter().fontFamily,

      // 4. Apply the configured TextTheme
      textTheme: interTextTheme,

      appBarTheme: AppBarTheme(
        backgroundColor: _surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          color: _onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(color: _onSurface),
      ),

      cardTheme: CardThemeData(
        color: _surface,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          // Set specific GoogleFonts style for buttons
          textStyle:
              GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: _surface,
        indicatorColor: colorScheme.primary.withValues(alpha: 0.1),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => GoogleFonts.inter(
            color: states.contains(WidgetState.selected)
                ? colorScheme.primary
                : _mutedGray,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            size: 24,
            color: states.contains(WidgetState.selected)
                ? colorScheme.primary
                : _mutedGray,
          ),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: _chipBg,
        labelStyle: GoogleFonts.inter(
          color: _primaryForest,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        shape: const StadiumBorder(side: BorderSide.none),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearMinHeight: 8,
        linearTrackColor: Colors.grey.shade200,
      ),
    );
  }
}
