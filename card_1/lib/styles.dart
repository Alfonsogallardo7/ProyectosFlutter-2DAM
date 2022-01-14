import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStyle {
  // Tamaño texto
  static const double textSizeSuperSmall = 12.0;
  static const double textSizeSmall = 15.0;
  static const double textSizeMedium = 17.0;
  static const double textSizeBig = 22.0;

  static const double bodyPadding = 10.0;
  static const double bodyPadding2 = 20.0;

  static const double borderRadius = 2.0;

  static TextStyle get textCiudad => GoogleFonts.getFont('Roboto',
      fontWeight: FontWeight.w600, fontSize: CardStyle.textSizeMedium);

  static TextStyle get subTittle => GoogleFonts.getFont('Roboto',
      color: Colors.black54, fontSize: CardStyle.textSizeSuperSmall);

  static TextStyle get subTittle2 => GoogleFonts.getFont('Roboto',
      color: Colors.black54, fontSize: CardStyle.textSizeSmall);

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
    );
  }
}
