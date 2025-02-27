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

final textTheme = GoogleFonts.poppinsTextTheme();

final defaultTheme = ThemeData().copyWith(
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kPrimaryContainer,
    foregroundColor: kOnPrimaryContainer,
    centerTitle: true,
    titleTextStyle: GoogleFonts.poppinsTextTheme().displayMedium?.copyWith(
          fontSize: 26,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
  ),
  scaffoldBackgroundColor: kSurface,
  textTheme: textTheme.copyWith(
      headlineSmall: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          )),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      foregroundColor: WidgetStatePropertyAll(kOnPrimaryContainer),
      alignment: Alignment.center,
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: kPrimaryContainer,
    selectedColor: kSecondaryContainer,
    side: const BorderSide(color: Colors.transparent),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    labelStyle: textTheme
        .titleSmall
        ?.copyWith(color: Colors.white),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(kPrimaryContainer),
      foregroundColor: const WidgetStatePropertyAll(kOnPrimaryContainer),
      textStyle: WidgetStatePropertyAll(
        GoogleFonts.poppinsTextTheme().headlineSmall?.copyWith(
              color: kOnPrimaryContainer,
            ),
      ),
    ),
  ),
);
