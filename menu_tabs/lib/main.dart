import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:listar_horizontal/models/personas_response.dart';
import 'package:listar_horizontal/models/planetas_response.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(
        title: 'Star Wars',
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Planetas>> items;
  late Future<List<Personas>> items2;

  @override
  void initState() {
    items2 = fetchPersonas();

    items = fetchPlanetas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow,
              bottom: const TabBar(indicatorColor: Colors.black, tabs: [
                Tab(icon: Icon(Icons.people, color: Colors.black,)),
                Tab(icon: Icon(Icons.people_alt, color: Colors.black,))
              ]),
              title: const Text(
                'Star Wars',
                style: TextStyle(fontFamily: 'StarJedi', color: Colors.black),
              ),
            ),
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/fondo_estrellas.gif",
                            ),
                            fit: BoxFit.cover)),
                  ),/*TabBarView(children: [
              
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          color: Colors.transparent,
                          margin: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 200,
                            child: FutureBuilder<List<Planetas>>(
                                future: items,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return _planetasList(snapshot.data!);
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  }
                                  return const CircularProgressIndicator();
                                }
                                /*return Card(
                            color: Colors.black,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  items.elementAt(index).name,
                                  style: const TextStyle(
                                      fontFamily: 'StarJedi',
                                      color: Colors.white),
                                ),
                                Image.network(
                                  'https://starwars-visualguide.com/assets/img/planets/${index + 1}.jpg',
                                  width: 150,
                                )
                              ],
                            ),
                          );
                        }*/
                                ),
                          ),
                        ),
                        Card(
                          color: Colors.transparent,
                          margin: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 200,
                            child: FutureBuilder<List<Personas>>(
                                future: items2,
                                builder: (context, index) {
                                  if (index.hasData) {
                                    return _personasList(index.data!);
                                  } else if (index.hasError) {
                                    return Text('${index.error}');
                                  }
                                  return const CircularProgressIndicator(); /*Card(
                            color: Colors.black,
                            child: Column(
                              children: <Widget>[
                                Text(items2.elementAt(index).name,
                                    style: const TextStyle(
                                        fontFamily: 'StarJedi',
                                        color: Colors.white)),
                                Image.network(
                                  'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                                  width: 100,
                                )
                              ],
                            ),
                          );*/
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ])*/
            
            
            
            /* SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/fondo_estrellas.gif",
                        ),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      color: Colors.transparent,
                      margin: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 200,
                        child: FutureBuilder<List<Planetas>>(
                            future: items,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return _planetasList(snapshot.data!);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return const CircularProgressIndicator();
                            }
                            /*return Card(
                            color: Colors.black,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  items.elementAt(index).name,
                                  style: const TextStyle(
                                      fontFamily: 'StarJedi',
                                      color: Colors.white),
                                ),
                                Image.network(
                                  'https://starwars-visualguide.com/assets/img/planets/${index + 1}.jpg',
                                  width: 150,
                                )
                              ],
                            ),
                          );
                        }*/
                            ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      margin: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 200,
                        child: FutureBuilder<List<Personas>>(
                            future: items2,
                            builder: (context, index) {
                              if (index.hasData) {
                                return _personasList(index.data!);
                              } else if (index.hasError) {
                                return Text('${index.error}');
                              }
                              return const CircularProgressIndicator(); /*Card(
                            color: Colors.black,
                            child: Column(
                              children: <Widget>[
                                Text(items2.elementAt(index).name,
                                    style: const TextStyle(
                                        fontFamily: 'StarJedi',
                                        color: Colors.white)),
                                Image.network(
                                  'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                                  width: 100,
                                )
                              ],
                            ),
                          );*/
                            }),
                      ),
                    ),
                  ],
                ),
              ),*/
            ]),
          ),
            ),
      ),
    );
  }

  

  Future<List<Personas>> fetchPersonas() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));
    if (response.statusCode == 200) {
      return PersonasResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load persons');
    }
  }

  Widget _personasList(List<Personas> personasList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: personasList.length,
      itemBuilder: (context, index) {
        return _personasItem(personasList.elementAt(index), index);
      },
    );
  }

  Widget _personasItem(Personas personas, int index) {
    return Card(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Text(personas.name,
              style:
                  const TextStyle(fontFamily: 'StarJedi', color: Colors.white)),
          Image.network(
            'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
            width: 120,
          )
        ],
      ),
    );
  }

  Future<List<Planetas>> fetchPlanetas() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/planets'));
    if (response.statusCode == 200) {
      return PlanetasResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load planets');
    }
  }

  Widget _planetasList(List<Planetas> planetasList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: planetasList.length,
      itemBuilder: (context, index) {
        return _planetasItem(planetasList.elementAt(index), index);
      },
    );
  }

  Widget _planetasItem(Planetas planetas, int index) {
    return Card(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Text(planetas.name,
                style: const TextStyle(
                    fontFamily: 'StarJedi', color: Colors.white)),
            Image.network(
              'https://starwars-visualguide.com/assets/img/planets/${index + 1}.jpg',
              width: 150,
            )
          ],
        ));
  }
}
