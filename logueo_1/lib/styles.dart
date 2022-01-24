import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginStyle {

static Color colorFondo =  Colors.grey[300] as Color;

static const double textSizeSmall = 15.0;
static const double textSizeMedium = 20.0;
static const double textSizeBig = 30.0;


  static TextStyle get textTittle => GoogleFonts.getFont(
'Open Sans',
color: Colors.grey[900],
fontWeight: FontWeight.bold,
fontSize:LoginStyle.textSizeBig
);

  static TextStyle get textSubTittle => GoogleFonts.getFont(
'Open Sans',
color: Colors.grey[600],
fontWeight: FontWeight.w600,
fontSize:LoginStyle.textSizeSmall
);

 static TextStyle get textTittle2 => GoogleFonts.getFont(
'Open Sans',
color: Colors.grey[800],
fontWeight: FontWeight.w600,
fontSize:LoginStyle.textSizeMedium
);
}