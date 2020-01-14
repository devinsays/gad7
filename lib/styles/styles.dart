import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:anxiety_tracker/styles/palette.dart';

class Styles {
  static TextStyle defaultStyle = TextStyle(
    color: Palette.white,
  );

  static TextStyle h1 = GoogleFonts.playfairDisplay(
    textStyle: defaultStyle.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 26.0,
    ),
  );

  static TextStyle q = GoogleFonts.playfairDisplay(
    textStyle: defaultStyle.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 26.0,
    ),
  );

  static TextStyle a = defaultStyle.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static TextStyle p = defaultStyle.copyWith(
    fontSize: 16.0,
    letterSpacing: .25,
    height: 20 / 16,
  );

  static TextStyle label = defaultStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );

  static TextStyle error = defaultStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 11.0,
    height: 14 / 11,
    color: Palette.danger500,
  );

  static InputDecoration input = InputDecoration(
    fillColor: Palette.white,
    focusColor: Palette.primary,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Palette.primary,
        width: 2.0,
      ),
    ),
    border: OutlineInputBorder(
      gapPadding: 1.0,
      borderSide: BorderSide(
        color: Palette.primary,
        width: 1.0,
      ),
    ),
    hintStyle: TextStyle(
      color: Palette.primary200,
    ),
  );
}
