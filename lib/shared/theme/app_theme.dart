import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonTheme,
    );
  }

  // Apps Color scheme
  static ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xfff4bbd3),
      onPrimary: Color(0xffFFFFFF),
      primaryContainer: Color(0xfff2f3fb),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color.fromARGB(255, 109, 180, 242),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdfa3b7),
      tertiary: Color(0xffb6c2ff),
      tertiaryContainer: Color(0xffffffff),
      errorContainer: Color(0xfffcd8df),
      onErrorContainer: Color(0xff000000),
      surfaceContainerHighest: Color(0xffeeeeee),
      outline: Color(0xff737373),
      outlineVariant: Color(0xffbfbfbf),
      inverseSurface: Color(0xff121212),
      surfaceTint: Color(0xff909cdf),
      error: Color(0xFF5e162e),
      onError: Color(0xFFf5e9ed),
      surface: Color.fromARGB(255, 255, 250, 239),
      onSurface: Color(0xFF0e1016),
    );
  }

  //Text theme
  static TextTheme get _textTheme {
    const textTheme = TextTheme();

    // Use Comfortaa SemiBold from Google Fonts
    final bodyFont = GoogleFonts.comfortaa(
      textStyle: textTheme.bodyMedium,
      fontWeight: FontWeight.w600, // SemiBold weight
    );

    return textTheme.copyWith(
      displayLarge: bodyFont.copyWith(fontWeight: FontWeight.w600),
      displayMedium: bodyFont.copyWith(fontWeight: FontWeight.w600),
      displaySmall: bodyFont.copyWith(fontWeight: FontWeight.w600),
      headlineLarge: bodyFont.copyWith(fontWeight: FontWeight.w600),
      headlineMedium: bodyFont.copyWith(fontWeight: FontWeight.w600),
      headlineSmall: bodyFont.copyWith(fontWeight: FontWeight.w600),
      bodyLarge: bodyFont,
      bodyMedium: bodyFont,
      bodySmall: bodyFont,
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: _colorScheme.surface,
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0,
      ),
      enabledBorder: _enabledBorder,
      focusedBorder: _focusedBorder,
      disabledBorder: _disabledBorder,
    );
  }

  //Button Theme
  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  // Input Field Theme
  static InputBorder get _enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.transparent),
      );

  static InputBorder get _focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      );

  static InputBorder get _disabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
      );
}
