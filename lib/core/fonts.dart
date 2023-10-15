import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static TextStyle sFProDisplay(
      double fontSize, Color color, FontWeight fontWeight,
      {bool underline = false,
      bool overLine = false,
      Color decorationColor = Colors.black}) {
    return TextStyle(
      fontFamily: "SFProDisplay",
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: underline != false
          ? TextDecoration.underline
          : overLine != false
              ? TextDecoration.lineThrough
              : TextDecoration.none,
    );
  }

  static TextStyle inter(double fontSize, Color color, FontWeight fontWeight,
      {bool underline = false,
      bool overLine = false,
      Color decorationColor = Colors.black}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: underline != false
          ? TextDecoration.underline
          : overLine != false
              ? TextDecoration.lineThrough
              : TextDecoration.none,
      decorationColor: decorationColor,
    );
  }

//Noto Sans
  static TextStyle notoSans(double fontSize, Color color, FontWeight fontWeight,
      {bool underline = false,
      bool overLine = false,
      Color decorationColor = Colors.black}) {
    return GoogleFonts.notoSans(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: underline != false
          ? TextDecoration.underline
          : overLine != false
              ? TextDecoration.lineThrough
              : TextDecoration.none,
      decorationColor: decorationColor,
    );
  }
}
