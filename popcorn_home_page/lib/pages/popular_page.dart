import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_home_page/models/popular_response.dart';
import 'package:http/http.dart' as http;
import 'package:popcorn_home_page/models/upcoming_response.dart';
import 'package:popcorn_home_page/pages/movie_page.dart';

class PopularPages extends StatefulWidget {
  const PopularPages({Key? key}) : super(key: key);

  @override
  _PopularPagesState createState() => _PopularPagesState();
}

class _PopularPagesState extends State<PopularPages> {
  late Future<List<Films>> items;
  late Future<List<UpFilms>> items2;

  @override
  void initState() {
    items = fetchFilms();
    items2 = fetchUpFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/memojis.jpg',
                        )),
                  ),
                  const Text(
                    'Ester Exposito',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey[200]),
                      child: Icon(
                        Icons.cast_rounded,
                        color: Colors.deepPurple[800],
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Movie, Series,',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    Text(
                      'TV Shows ...',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                  ],
                ),
              ),
              Stack(children: <Widget>[
                //Flexible(flex: 1, child: Container(color: Colors.grey)),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        margin: const EdgeInsets.only(
                            top: 40, bottom: 40, left: 20),
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 5.0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.deepPurple[800],
                                  size: 25,
                                ),
                              ),
                              const Text(
                                'Search',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 17,
                                    color: Color(0xFFBDBDBD)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.deepPurple[800]),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ]),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            'Up Coming',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
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
                                    child: FutureBuilder<List<UpFilms>>(
                                        future: items2,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return _upFilmsList(snapshot.data!);
                                          } else if (snapshot.hasError) {
                                            return Text('${snapshot.error}');
                                          }
                                          return const CircularProgressIndicator();
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        )
                      ])),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
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
                                ],
                              ),
                            ),
                          ]),
                        )
                      ])),
            ],
          ),
        ),
      ),
    ));
  }

  Future<List<UpFilms>> fetchUpFilms() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=d64edfd74101230753aa7b2393ffe8df&language=en-US&page=1'));
    if (response.statusCode == 200) {
      return UpComingResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load films');
    }
  }

  Widget _upFilmsList(List<UpFilms> upFilmsList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: upFilmsList.length,
      itemBuilder: (context, index) {
        return _upFilmsItem(upFilmsList.elementAt(index), index);
      },
    );
  }

  Widget _upFilmsItem(UpFilms upFilms, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: SizedBox(
          width: 115,
          height: 100,
          child: Column(           
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MoviePage())
                    );
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w200${upFilms.posterPath}',
                        width: 115,
                        fit: BoxFit.fill,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    upFilms.title,
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
                          upFilms.voteAverage.toString(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ])),
    );
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
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ])),
    );
  }
}
