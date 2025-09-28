import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppTheme {
  static const Color _primaryColor = Color(0xFFe0293b);
  static const Color _lightBackgroundColor = Color(0xFFf8f6f6);
  static const Color _darkBackgroundColor = Color(0xFF211113);

  static final TextTheme _appTextTheme = TextTheme(
    displayLarge: const TextStyle(fontFamily: 'Tutano', fontSize: 57, fontWeight: FontWeight.bold),
    displayMedium: const TextStyle(fontFamily: 'Tutano', fontSize: 45, fontWeight: FontWeight.w600),
    displaySmall: const TextStyle(fontFamily: 'Tutano', fontSize: 36, fontWeight: FontWeight.w600),
    headlineLarge: const TextStyle(fontFamily: 'Tutano', fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle(fontFamily: 'Tutano', fontSize: 28, fontWeight: FontWeight.bold),
    headlineSmall: const TextStyle(fontFamily: 'Tutano', fontSize: 24, fontWeight: FontWeight.w500),
    titleLarge: GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w700),
    titleMedium: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w700),
    titleSmall: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w700),
    bodyLarge: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w400),
    labelLarge: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w500),
    labelMedium: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: GoogleFonts.plusJakartaSans(fontSize: 10, fontWeight: FontWeight.w500),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
      background: _lightBackgroundColor,
    ),
    scaffoldBackgroundColor: _lightBackgroundColor,
    textTheme: _appTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
      titleTextStyle: _appTextTheme.titleLarge?.copyWith(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: _primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9999)), // full
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: _appTextTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.dark,
      background: _darkBackgroundColor,
    ),
    scaffoldBackgroundColor: _darkBackgroundColor,
    textTheme: _appTextTheme.apply(bodyColor: Colors.white70, displayColor: Colors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
      titleTextStyle: _appTextTheme.titleLarge?.copyWith(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: _primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9999)), // full
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: _appTextTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
