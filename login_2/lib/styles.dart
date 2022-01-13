import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginStyle {
//Color

  static const Color whiteColor = Color(0xFFFFFFFF);

//Padding
  static const double bodyPadding = 8.0;

//Font sizes, TextStyles
  static const double textSizeMedium = 20.0;

  static TextStyle get textTittle => GoogleFonts.getFont(
        'Nunito',
        fontWeight: FontWeight.bold,
        color: LoginStyle.whiteColor,
        fontSize: 20,
      );
}
