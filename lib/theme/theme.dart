import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kPrimaryContainer = Colors.black.withOpacity(0.8);
const kOnPrimaryContainer = Colors.white;
const kSurface = Colors.white;
const kOnSurface = Colors.black;

const kSecondaryContainer = Color.fromRGBO(255, 31, 31, 1);
const kOnSecondaryContainer = Colors.white;

const kRatingColor = Color.fromRGBO(255, 193, 0, 1);

final kCoffeeCardBackground = Colors.black.withOpacity(0.05);

final defaultTheme = ThemeData().copyWith(
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kPrimaryContainer,
    foregroundColor: kOnPrimaryContainer,
    centerTitle: true,
  ),
  scaffoldBackgroundColor: kSurface,
  textTheme: GoogleFonts.poppinsTextTheme(),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(kPrimaryContainer),
      foregroundColor: const WidgetStatePropertyAll(kOnPrimaryContainer),
      alignment: Alignment.center,
    ),
  ),
);
