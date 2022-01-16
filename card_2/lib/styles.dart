import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStyle {

static const Color colorVerde = Colors.green;
static  Color gris = Colors.grey[400] as Color;


static const double smallBodyPadding = 5.0;
static const double bodyPadding = 15.0;
static const double bodyPadding2 = 20.0;

static const double textSizeBig = 20.0;
static const double textSizeMedium = 16.0;


static TextStyle get textTittle => GoogleFonts.getFont(
'Roboto',
fontWeight: FontWeight.w500,
fontSize:CardStyle.textSizeBig
);

static TextStyle get textPuntuacion => GoogleFonts.getFont(
'Roboto',
fontWeight: FontWeight.bold,
color: CardStyle.colorVerde
);

static TextStyle get textOfertas => GoogleFonts.getFont(
'Roboto',
color: CardStyle.gris
);

static TextStyle get textInferior => GoogleFonts.getFont(
  'Roboto',
  color: Colors.blue,
  fontSize: CardStyle.textSizeMedium
);

}