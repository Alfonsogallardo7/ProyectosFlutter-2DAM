import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meteor_app/models/eltiempo_response.dart';
import 'package:meteor_app/pages/home_page.dart';
import 'package:meteor_app/pages/prediccion_tierra_principal.dart';
import 'package:http/http.dart' as http;
import 'package:meteor_app/styles.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ElTiempoDetails extends StatefulWidget {
  const ElTiempoDetails({Key? key}) : super(key: key);

  @override
  _ElTiempoDetailsState createState() => _ElTiempoDetailsState();
}

class _ElTiempoDetailsState extends State<ElTiempoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/fondo_estrellas.png",
                        ),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65.0, left: 10),
                child: InkWell(
                  child: Icon(
                    CupertinoIcons.back,
                    color: MeteorAppStyle.colorTitulo,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));
                  },
                ),
              )
            ])));
  }

  Future<ElTiempoResponse> fetchTiempo() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Triana&appid=f597bdebe1ce3e95e4597d0e583b2a32&units=metric&lang=es'));
    if (response.statusCode == 200) {
      return ElTiempoResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Widget _elTiempoItem(ElTiempoResponse elTiempoResponse) {
    var date = DateTime.fromMillisecondsSinceEpoch(elTiempoResponse.dt);
    initializeDateFormatting();
    var week = DateFormat('EEE', 'es_ES').format(date);

    return InkWell(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(elTiempoResponse.name, style: MeteorAppStyle.styloCiudad),
            Text('${elTiempoResponse.main.temp.toInt().toString()}º',
                style: MeteorAppStyle.styloTemp),
            Text(elTiempoResponse.weather.first.description,
                style: MeteorAppStyle.styloDescripcion),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                  'Max: ${elTiempoResponse.main.tempMax.toInt().toString()} Min: ${elTiempoResponse.main.tempMin.toInt().toString()}',
                  style: MeteorAppStyle.styloTempMaxyMin),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ElTiempoDetails()));
      },
    );
  }
}
