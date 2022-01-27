import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_home_page/models/popular_response.dart';
import 'package:http/http.dart' as http;

class PopularPages extends StatefulWidget {
  const PopularPages({Key? key}) : super(key: key);

  @override
  _PopularPagesState createState() => _PopularPagesState();
}

class _PopularPagesState extends State<PopularPages> {
  late Future<List<Films>> items;

  @override
  void initState() {
    items = fetchFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[400],
            ),
            margin: const EdgeInsets.all(40),
            width: MediaQuery.of(context).size.width,
            child: Stack(children: <Widget>[
              Flexible(flex: 1, child: Container(color: Colors.grey)),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[400],
                  ),
                  alignment: Alignment.center,
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    //onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SingIn()));},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF212121)),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 300,
                          child: FutureBuilder<List<Films>>(
                              future: items,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _filmsList(snapshot.data!);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              }),
                        ),
                      ]),
                )
              ])),
        ],
      ),
    ));
  }

  Future<List<Films>> fetchFilms() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=d64edfd74101230753aa7b2393ffe8df&language=es-ES&page=1'));
    if (response.statusCode == 200) {
      return PopularResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load films');
    }
  }

  Widget _filmsList(List<Films> filmsList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filmsList.length,
      itemBuilder: (context, index) {
        return _filmsItem(filmsList.elementAt(index), index);
      },
    );
  }

  Widget _filmsItem(Films films, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: SizedBox(
          width: 115,
          height: 100,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w200${films.posterPath}',
                      width: 115,
                      fit: BoxFit.fill,
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    films.title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Text(
                          films.voteAverage.toString(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ))
              ])),
    );
  }
}
