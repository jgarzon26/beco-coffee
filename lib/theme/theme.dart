import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kPrimaryContainer = Colors.black.withOpacity(0.8);
const kOnPrimaryContainer = Colors.white;
const kSurface = Colors.white;

const kSecondaryContainer = Color.fromRGBO(255, 31, 31, 1);
const kOnSecondaryContainer = Colors.white;

final defaultTheme = ThemeData().copyWith(
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kPrimaryContainer,
    foregroundColor: kOnPrimaryContainer,
    centerTitle: true,
  ),
  scaffoldBackgroundColor: kSurface,
  textTheme: GoogleFonts.poppinsTextTheme(),
);
