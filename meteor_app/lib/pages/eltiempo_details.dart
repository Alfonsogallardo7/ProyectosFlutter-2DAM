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
import 'package:meteor_app/utils/constanst.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return SharedPreferences.getInstance().then((prefs) async {
      lat = prefs.getDouble('lat');
      lng = prefs.getDouble('lng');
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&appid=${ApiId}&units=metric&lang=es'));
       if (response.statusCode == 200) {
      return ElTiempoResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
    });
  }

  Widget _elTiempoItem(ElTiempoResponse elTiempoResponse) {
    var date = DateTime.fromMillisecondsSinceEpoch(elTiempoResponse.dt);
    var puestaSol =
        DateTime.fromMillisecondsSinceEpoch(elTiempoResponse.sys.sunset * 1000);
    var amanecer = DateTime.fromMillisecondsSinceEpoch(
        elTiempoResponse.sys.sunrise * 1000);

    initializeDateFormatting();
    var week = DateFormat('EEE', 'es_ES').format(date);

    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 10),
                    child: InkWell(
                      child: Icon(
                        CupertinoIcons.back,
                        color: MeteorAppStyle.colorTitulo,
                        size: 30,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 75),
                    child: Column(
                      children: [
                        Text(elTiempoResponse.name!,
                            style: MeteorAppStyle.styloCiudad),
                        Text(
                            '${elTiempoResponse.main.temp.toInt().toString()}?? | ${elTiempoResponse.weather.first.description}',
                            style: MeteorAppStyle.styloTempHoras),
                      ],
                    ),
                  ),
                ],
              ),
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
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: 180,
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
                              padding: EdgeInsets.only(top: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const <Widget>[
                                          Icon(
                                            CupertinoIcons.thermometer_sun,
                                            color: Colors.white,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 25.0),
                                            child: Icon(
                                              CupertinoIcons
                                                  .thermometer_snowflake,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            ' ${elTiempoResponse.main.tempMax.toInt()}??',
                                            style:
                                                MeteorAppStyle.styloTempHoras,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25.0),
                                            child: Text(
                                              ' ${elTiempoResponse.main.tempMin.toInt()}??',
                                              style:
                                                  MeteorAppStyle.styloTempHoras,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
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
                      width: MediaQuery.of(context).size.width / 2.3,
                      //width: 160,
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.sun_max_fill,
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
                              padding: EdgeInsets.only(top: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const <Widget>[
                                          Icon(
                                            CupertinoIcons.sunrise_fill,
                                            color: Colors.white,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 25.0),
                                            child: Icon(
                                              CupertinoIcons.sunset_fill,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            '${amanecer.hour} : ${amanecer.minute}',
                                            style:
                                                MeteorAppStyle.styloTempHoras,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25.0),
                                            child: Text(
                                              '${puestaSol.hour}: ${puestaSol.minute}',
                                              style:
                                                  MeteorAppStyle.styloTempHoras,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                      width: MediaQuery.of(context).size.width / 2.3,

                      //width: 160,
                      height: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.wind,
                                  size: 15,
                                  color: MeteorAppStyle.colorTitulo,
                                ),
                                Text(' VIENTO',
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
                              padding: EdgeInsets.only(top: 45.0),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${elTiempoResponse.wind.speed} m/s',
                                        style: MeteorAppStyle.styloTempHoras,
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      bottom: 15,
                      right: 15,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: MeteorAppStyle.colorAzul.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width / 2.3,
                      //width: 160,
                      height: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.drop_fill,
                                  size: 15,
                                  color: MeteorAppStyle.colorTitulo,
                                ),
                                Text(' HUMEDAD',
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
                              padding: EdgeInsets.only(top: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      CircularPercentIndicator(
                                        radius: 70.0,
                                        lineWidth: 2.0,
                                        animation: true,
                                        percent: elTiempoResponse.main.humidity
                                                .toDouble() /
                                            100,
                                        center: Text(
                                          '${elTiempoResponse.main.humidity}%',
                                          style: MeteorAppStyle
                                              .styloCircularPercent,
                                        ),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: Colors.white,
                                        backgroundColor:
                                            MeteorAppStyle.colorTitulo,
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                      width: MediaQuery.of(context).size.width / 2.3,

                      //width: 160,
                      height: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.eye_fill,
                                  size: 15,
                                  color: MeteorAppStyle.colorTitulo,
                                ),
                                Text(' VISIBILIDAD',
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
                              padding: EdgeInsets.only(top: 45.0),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${(elTiempoResponse.visibility / 1000).toInt()} km',
                                        style: MeteorAppStyle.styloTempHoras,
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      bottom: 15,
                      right: 15,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: MeteorAppStyle.colorAzul.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width / 2.3,
                      //width: 160,
                      height: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.gauge,
                                  size: 15,
                                  color: MeteorAppStyle.colorTitulo,
                                ),
                                Text(' PRESI??N',
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
                              padding: EdgeInsets.only(top: 45.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        '${elTiempoResponse.main.pressure} hPa',
                                        style: MeteorAppStyle.styloTempHoras,
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
