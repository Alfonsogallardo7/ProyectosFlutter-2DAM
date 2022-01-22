import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar/models/personajes_response.dart';
import 'package:http/http.dart' as http;

class PersonajesPages extends StatefulWidget {
  const PersonajesPages({Key? key}) : super(key: key);

  @override
  _PersonajesPagesState createState() => _PersonajesPagesState();
}


class _PersonajesPagesState extends State<PersonajesPages> {
  late Future<List<Personajes>> items;

  @override
  void initState() {
    items = fetchPersonajes();
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
                          "assets/images/fondo_portal.png",
                        ),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: 200,
                          child: FutureBuilder<List<Personajes>>(
                              future: items,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _personajesList(snapshot.data!);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              }),
                        ),
                      ),
                    ]),
              )
            ])));
  }

  Future<List<Personajes>> fetchPersonajes() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    if (response.statusCode == 200) {
      return PersonajesResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load persons');
    }
  }

  Widget _personajesList(List<Personajes> personajesList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: personajesList.length,
      itemBuilder: (context, index) {
        return _personajesItem(personajesList.elementAt(index), index);
      },
    );
  }

  Widget _personajesItem(Personajes personajes, int index) {
    return Card(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Text(personajes.name, style: TextStyle(fontFamily: 'Rick', color: Colors.white),),
          ),
          Image.network(
            'https://rickandmortyapi.com/api/character/avatar/${index + 1}.jpeg',
            width: 120,
          )
        ],
      ),
    );
  }
}
