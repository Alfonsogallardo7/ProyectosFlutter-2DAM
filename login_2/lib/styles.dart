import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginStyle {
//Color

  static const Color whiteColor = Color(0xFFFFFFFF);

//Padding
  static const double bodyPadding = 8.0;

//Font sizes, TextStyles
  static const double textSizeSmall = 14.0;
  static const double textSizeMedium = 17.0;
  static const double textSizeBig = 22.0;
  static const double textSizeTittle = 27.0;

  static TextStyle get textSkip => GoogleFonts.getFont(
        'Nunito',
        fontWeight: FontWeight.bold,
        color: LoginStyle.whiteColor,
        fontSize: LoginStyle.textSizeMedium,
      );

  static TextStyle get textTittle => GoogleFonts.getFont(
        'Be Vietnam Pro',
        fontWeight: FontWeight.bold,
        color: LoginStyle.whiteColor,
        fontSize: LoginStyle.textSizeTittle,
      );

  static TextStyle textFormat(Color c, double size) => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: c,
        fontWeight: FontWeight.normal,
        fontSize: size
      );
}
