import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStyle {

  // Tamaño texto
  static const double textSizeSmall = 14.0;
  static const double textSizeMedium = 17.0;
  static const double textSizeBig = 22.0;

  static const double bodyPadding = 8.0;

  static TextStyle get textCiudad => GoogleFonts.getFont(
  'Roboto',
  fontWeight: FontWeight.w600,
  fontSize: CardStyle.textSizeSmall
  );

  BoxDecoration myBoxDecoration () {
    return BoxDecoration (
      border: Border.all(),
    );
  }
}
