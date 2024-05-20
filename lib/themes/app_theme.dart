import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 116, 175, 251),
  secondary: const Color.fromARGB(255, 18, 45, 81),
);

final kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 246, 250, 139),
);

class AppTheme {
  var snackBarTheme = const SnackBarThemeData(
    backgroundColor: Colors.red,
  );

  var cardTheme = const CardTheme().copyWith(
    color: kColorScheme.background,
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  );

  var elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primary,
      foregroundColor: kColorScheme.onPrimary,
    ),
  );

  var textTheme = const TextTheme().copyWith(
    titleLarge: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      color: kColorScheme.primary,
      fontSize: 18,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      color: kColorScheme.secondary,
      fontSize: 16,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: kColorScheme.secondary,
      fontSize: 16,
    ),
  );

  var darkCardTheme = const CardTheme().copyWith(
    color: kDarkColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  var darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kDarkColorScheme.primaryContainer,
      foregroundColor: kDarkColorScheme.onPrimaryContainer,
    ),
  );

  var darkTextTheme = const TextTheme().copyWith(
    titleLarge: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      color: kDarkColorScheme.onSecondaryContainer,
      fontSize: 20,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontWeight: FontWeight.normal,
      color: kDarkColorScheme.onSecondaryContainer,
      fontSize: 15,
    ),
  );
}
