import 'package:flutter/material.dart';

class MeteorAppStyle {

static Color colorAzul = Color(0XFF2A3040) as Color;

static Color colorTitulo = Color(0XFF5F646A) as Color;

static const double textoCuidad = 37;

static const double textoDescripcion = 24;

static const double textoMaxyMin = 21;

static const double textoTempHoras = 22;

static const double textoHoras = 17;

static const double textoTemperatura = 102;

static const double textoMiniTittle = 15;

static TextStyle styloCiudad = TextStyle(fontSize: MeteorAppStyle.textoCuidad, color: Colors.white);

static TextStyle styloTemp = TextStyle(fontSize: MeteorAppStyle.textoTemperatura, color: Colors.white, fontWeight: FontWeight.w200);

static TextStyle styloTempMin = TextStyle(fontSize: MeteorAppStyle.textoTemperatura, color: MeteorAppStyle.colorTitulo, fontWeight: FontWeight.w200);

static TextStyle styloDescripcion = TextStyle(fontSize: MeteorAppStyle.textoDescripcion, color: Colors.white);

static TextStyle styloTempMaxyMin = TextStyle(fontSize: MeteorAppStyle.textoMaxyMin, color: Colors.white);

static TextStyle styloMiniTittle = TextStyle(fontSize: MeteorAppStyle.textoMiniTittle, color: MeteorAppStyle.colorTitulo);

static TextStyle styloTempHoras = TextStyle(fontSize: MeteorAppStyle.textoTempHoras, color: Colors.white);

static TextStyle styloHoras = TextStyle(fontSize: MeteorAppStyle.textoHoras, color: Colors.white);

static TextStyle styloCircularPercent = TextStyle(fontSize: MeteorAppStyle.textoMiniTittle, color: Colors.white);

}