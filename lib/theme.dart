import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF007494);
  static const Color secondaryColor = Color(0xFF54D6F4);
  static const Color accentColor = Color(0xFFB2E9F6);
  static const Color textColor = Color(0xFF000000);
  static const Color backgroundColor = Color(0xFFFEFEFE);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: textColor), // Replaces headline1
      headlineMedium: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: textColor), // Replaces headline2
      titleLarge: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: textColor), // Replaces headline3
      bodyLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.normal, color: textColor), // Replaces bodyText1
      bodyMedium: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal, color: textColor), // Replaces bodyText2
    ),
  );
}
