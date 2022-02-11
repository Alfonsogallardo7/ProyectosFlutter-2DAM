import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meteor_app/models/eltiempo_horas_response.dart';
import 'package:meteor_app/models/eltiempo_response.dart';
import 'package:meteor_app/models/eltiempo_sietedays_response.dart';
import 'package:meteor_app/pages/eltiempo_details.dart';
import 'package:meteor_app/styles.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:meteor_app/utils/constanst.dart';
import 'package:meteor_app/utils/preferences.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  PreferenceUtils.init();
  runApp(const PrediccionTierraPrincipal());
}

class PrediccionTierraPrincipal extends StatefulWidget {
  const PrediccionTierraPrincipal({Key? key}) : super(key: key);

  @override
  _PrediccionTierraPrincipalState createState() =>
      _PrediccionTierraPrincipalState();
}

class _PrediccionTierraPrincipalState extends State<PrediccionTierraPrincipal> {
  late Future<List<Hourly>> items;
  late Future<ElTiempoResponse> items2;
  late Future<List<Daily>> items3;
  late double? lat = 37.379647, lng = -6.0069196;

  @override
  void initState() {
    super.initState();

    items = fetchPorHoras();
    items2 = fetchTiempo();
    items3 = fetchPorSieteDias();
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
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 85),
                  child: Column(children: <Widget>[
                    /*Text('Sevilla', style: MeteorAppStyle.styloCiudad),
                    Text('20º', style: MeteorAppStyle.styloTemp),
                    Text('Mayormente Soleado',
                        style: MeteorAppStyle.styloDescripcion),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text('Max:20º Min:15º',
                          style: MeteorAppStyle.styloTempMaxyMin),
                    ),*/
                    SizedBox(
                      height: 240,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MeteorAppStyle.colorAzul.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 350,
                        height: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, bottom: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.time,
                                    size: 15,
                                    color: MeteorAppStyle.colorTitulo,
                                  ),
                                  Text(' POR HORAS',
                                      style: MeteorAppStyle.styloMiniTittle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Container(
                                height: 1,
                                width: 350,
                                decoration: BoxDecoration(
                                    color: MeteorAppStyle.colorTitulo),
                              ),
                            ),
                            SizedBox(
                              height: 120,
                              child: FutureBuilder<List<Hourly>>(
                                  future: items,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return _upPorHorasList(snapshot.data!);
                                    } else if (snapshot.hasError) {
                                      return Text('${snapshot.error}');
                                    }
                                    return const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ));
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MeteorAppStyle.colorAzul.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 350,
                        height: 480,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, bottom: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.calendar,
                                    size: 15,
                                    color: MeteorAppStyle.colorTitulo,
                                  ),
                                  Text(' 7-DAY FORECAST',
                                      style: MeteorAppStyle.styloMiniTittle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Container(
                                height: 1,
                                width: 350,
                                decoration: BoxDecoration(
                                    color: MeteorAppStyle.colorTitulo),
                              ),
                            ),
                            SizedBox(
                              height: 420,
                              child: FutureBuilder<List<Daily>>(
                                  future: items3,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return _porSieteDiasList(snapshot.data!);
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
                          ],
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ]),
      ),
    );
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
        throw Exception(
            'https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&appid=${ApiId}&units=metric&lang=es');
      }
    });
  }

  Widget _elTiempoItem(ElTiempoResponse elTiempoResponse) {
    var date = DateTime.fromMillisecondsSinceEpoch(elTiempoResponse.dt);
    initializeDateFormatting();
    var week = DateFormat('EEE', 'es_ES').format(date);

    return InkWell(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(elTiempoResponse.name!, style: MeteorAppStyle.styloCiudad),
            Text('${elTiempoResponse.main.temp.toInt().toString()}º',
                style: MeteorAppStyle.styloTemp),
            Text(elTiempoResponse.weather.first.description!.toString(),
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

  Future<List<Hourly>> fetchPorHoras() async {
    return SharedPreferences.getInstance().then((prefs) async {
      lat = prefs.getDouble('lat');
      lng = prefs.getDouble('lng');
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lng}&exclude=minutely,daily&appid=${ApiId}&units=metric'));
      if (response.statusCode == 200) {
        return PorHorasResponse.fromJson(jsonDecode(response.body)).hourly;
      } else {
        throw Exception('Failed to load weather');
      }
    });
  }

  Widget _upPorHorasList(List<Hourly> hourlyList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: hourlyList.length,
      itemBuilder: (context, index) {
        return _porHorasItem(hourlyList.elementAt(index));
      },
    );
  }

  Widget _porHorasItem(Hourly hourly) {
    var date = DateTime.fromMillisecondsSinceEpoch(hourly.dt * 1000);
    return Container(
      margin: const EdgeInsets.only(right: 7),
      child: SizedBox(
          width: 100,
          height: 100,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                      date.hour.toString() +
                          ':' +
                          date.minute.toString() +
                          date.second.toString(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: MeteorAppStyle.styloHoras),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/icons/${hourly.weather.first.icon}.png',
                        width: 30,
                        fit: BoxFit.fill,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(hourly.temp.toInt().toString() + 'º',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: MeteorAppStyle.styloTempHoras),
                ),
              ])),
    );
  }

  Future<List<Daily>> fetchPorSieteDias() async {
    return SharedPreferences.getInstance().then((prefs) async {
      lat = prefs.getDouble('lat');
      lng = prefs.getDouble('lng');
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lng}&exclude=minutely,current,hourly,alerts&appid=${ApiId}&units=metric&lang=es'));
      if (response.statusCode == 200) {
        return ElTiempoSieteDaysResponse.fromJson(jsonDecode(response.body))
            .daily;
      } else {
        throw Exception('Failed to load weather');
      }
    });
  }

  Widget _porSieteDiasList(List<Daily> dailyList) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: dailyList.length,
      itemBuilder: (context, index) {
        return _porSieteDiasItem(dailyList.elementAt(index));
      },
    );
  }

  Widget _porSieteDiasItem(Daily daily) {
    var date = DateTime.fromMillisecondsSinceEpoch(daily.dt * 1000);
    initializeDateFormatting();
    var week = DateFormat('E', 'es_ES').format(date).toUpperCase();
    return Container(
      margin: const EdgeInsets.only(right: 7),
      child: SizedBox(
          width: 350,
          height: 80,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(week + ' ' + date.day.toString(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: MeteorAppStyle.styloHoras),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 210,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                            child: Image.asset(
                          'assets/icons/${daily.weather.first.icon}.png',
                          width: 30,
                        )),
                        Text(daily.temp.min.toInt().toString() + 'º',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: MeteorAppStyle.styloTempHoras),
                        Text(daily.temp.max.toInt().toString() + 'º',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: MeteorAppStyle.styloTempHoras),
                      ],
                    ))
              ])),
    );
  }
}
