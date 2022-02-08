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
  late Future<ElTiempoResponse> items2;

  @override
  void initState() {
    items2 = fetchTiempo();
    super.initState();
  }

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
                padding: const EdgeInsets.only(top: 50.0, left: 10),
                child: InkWell(
                  child: Icon(
                    CupertinoIcons.back,
                    color: MeteorAppStyle.colorTitulo,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder<ElTiempoResponse>(
                    future: items2,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return _elTiempoItem(snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const Padding(
                          padding: EdgeInsets.all(90),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ));
                    }),
              ),
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
    var puestaSol =
        DateTime.fromMillisecondsSinceEpoch(elTiempoResponse.sys.sunset);
    var amanecer =
        DateTime.fromMillisecondsSinceEpoch(elTiempoResponse.sys.sunrise);

    initializeDateFormatting();
    var week = DateFormat('EEE', 'es_ES').format(date);

    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(elTiempoResponse.name, style: MeteorAppStyle.styloCiudad),
            Text(
                '${elTiempoResponse.main.temp.toInt().toString()}º | ${elTiempoResponse.weather.first.description}',
                style: MeteorAppStyle.styloTempHoras),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, bottom: 15, left: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MeteorAppStyle.colorAzul.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 170,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.thermometer,
                                size: 15,
                                color: MeteorAppStyle.colorTitulo,
                              ),
                              Text(' TEMPERATURA',
                                  style: MeteorAppStyle.styloMiniTittle),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Container(
                            height: 1,
                            width: 350,
                            decoration: BoxDecoration(
                                color: MeteorAppStyle.colorTitulo),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [Icon(CupertinoIcons.thermometer_sun) ,Text('${elTiempoResponse.main.tempMax.toInt()}º'),
                              Text('${elTiempoResponse.main.tempMin.toInt()}º')],
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, bottom: 15, right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MeteorAppStyle.colorAzul.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 170,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.sun_max,
                                size: 15,
                                color: MeteorAppStyle.colorTitulo,
                              ),
                              Text(' SOL',
                                  style: MeteorAppStyle.styloMiniTittle),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Container(
                            height: 1,
                            width: 350,
                            decoration: BoxDecoration(
                                color: MeteorAppStyle.colorTitulo),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                  '${puestaSol.hour}: ${puestaSol.minute}: ${puestaSol.second}'),
                              Text(
                                  '${amanecer.hour} : ${amanecer.minute}: ${puestaSol.second}')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
