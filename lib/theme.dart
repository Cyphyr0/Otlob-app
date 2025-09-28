import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppTheme {
  static const Color _primarySeedColor = Color(0xFF673AB7);

  static const TextTheme _appTextTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: 'Tutano', fontSize: 57, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontFamily: 'Tutano', fontSize: 45, fontWeight: FontWeight.w600),
    displaySmall: TextStyle(fontFamily: 'Tutano', fontSize: 36, fontWeight: FontWeight.w600),
    headlineLarge: TextStyle(fontFamily: 'Tutano', fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontFamily: 'Tutano', fontSize: 28, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontFamily: 'Tutano', fontSize: 24, fontWeight: FontWeight.w500),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primarySeedColor,
      brightness: Brightness.light,
    ),
    textTheme: _appTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: _primarySeedColor,
      foregroundColor: Colors.white,
      titleTextStyle: _appTextTheme.titleLarge?.copyWith(color: Colors.white),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.4),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: _primarySeedColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: _appTextTheme.labelLarge,
        elevation: 8,
        shadowColor: _primarySeedColor.withOpacity(0.4),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primarySeedColor,
        textStyle: _appTextTheme.labelLarge,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade100,
      prefixIconColor: Colors.grey.shade600,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _primarySeedColor, width: 2),
      ),
    ),
  );

  static final ThemeData darkTheme = () {
    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: _primarySeedColor,
      brightness: Brightness.dark,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      scaffoldBackgroundColor: const Color(0xFF121212),
      textTheme: _appTextTheme.apply(bodyColor: darkColorScheme.onSurface, displayColor: darkColorScheme.onSurface),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: darkColorScheme.onSurface,
        iconTheme: IconThemeData(color: darkColorScheme.onSurface),
        titleTextStyle: _appTextTheme.titleLarge?.copyWith(color: darkColorScheme.onSurface),
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.6),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: darkColorScheme.onPrimary,
          backgroundColor: darkColorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: _appTextTheme.labelLarge,
          elevation: 8,
          shadowColor: darkColorScheme.primary.withOpacity(0.4),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: darkColorScheme.primary,
          textStyle: _appTextTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        prefixIconColor: darkColorScheme.onSurfaceVariant,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: darkColorScheme.primary, width: 2),
        ),
      ),
    );
  }();
}
