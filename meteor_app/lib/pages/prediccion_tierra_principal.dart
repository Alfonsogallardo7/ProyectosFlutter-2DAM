import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meteor_app/models/eltiempo_horas_response.dart';
import 'package:meteor_app/models/eltiempo_response.dart';
import 'package:meteor_app/styles.dart';
import 'package:http/http.dart' as http;

class PrediccionTierraPrincipal extends StatefulWidget {
  const PrediccionTierraPrincipal({Key? key}) : super(key: key);

  @override
  _PrediccionTierraPrincipalState createState() =>
      _PrediccionTierraPrincipalState();
}

class _PrediccionTierraPrincipalState extends State<PrediccionTierraPrincipal> {
  late Future<List<Hourly>> items;

  @override
  void initState() {
    items = fetchPorHoras();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 85),
                child: Column(children: <Widget>[
                  Text('Sevilla', style: MeteorAppStyle.styloCiudad),
                  Text('20º', style: MeteorAppStyle.styloTemp),
                  Text('Mayormente Soleado',
                      style: MeteorAppStyle.styloDescripcion),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text('Max:20º Min:15º',
                        style: MeteorAppStyle.styloTempMaxyMin),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: MeteorAppStyle.colorAzul.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 350,
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 10.0, bottom: 10),
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
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Container(
                              height: 1,
                              width: 350,
                              decoration: BoxDecoration(
                                  color: MeteorAppStyle.colorTitulo),
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            child: FutureBuilder<List<Hourly>>(
                                future: items,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return _upPorHorasList(snapshot.data!);
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  }
                                  return const CircularProgressIndicator();
                                }),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ]),
      ),
    );
  }

  Future<ElTiempoResponse> fetchTiempo() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Triana&appid=f597bdebe1ce3e95e4597d0e583b2a32&lang=es'));
    if (response.statusCode == 200) {
      return ElTiempoResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Widget _elTiempoList(List<ElTiempoResponse> elTiempoList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: elTiempoList.length,
      itemBuilder: (context, index) {
        return _elTiempoItem(elTiempoList.elementAt(index), index);
      },
    );
  }

  Widget _elTiempoItem(ElTiempoResponse elTiempoResponse, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
    );
  }

  Future<List<Hourly>> fetchPorHoras() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=37.3826&lon=-5.99629&exclude=minutely,daily&appid=f597bdebe1ce3e95e4597d0e583b2a32&units=metric'));
    if (response.statusCode == 200) {
      return PorHorasResponse.fromJson(jsonDecode(response.body)).hourly;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Widget _upPorHorasList(List<Hourly> hourlyList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: hourlyList.length,
      itemBuilder: (context, index) {
        return _porHorasItem(hourlyList.elementAt(index), index);
      },
    );
  }

  Widget _porHorasItem(Hourly hourly, int index) {
    var date = DateTime.fromMillisecondsSinceEpoch(hourly.dt * 1000);
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: SizedBox(
          width: 100,
          height: 100,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        date.hour.toString() + ':' + date.minute.toString() + date.second.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      )),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/icons/${hourly.weather.first.icon}.png',
                      width: 30,
                      fit: BoxFit.fill,
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    hourly.temp.toInt().toString()+ 'º',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                
              ])),
    );
  }
}
