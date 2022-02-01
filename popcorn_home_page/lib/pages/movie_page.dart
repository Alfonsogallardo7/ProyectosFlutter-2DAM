import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late Future<List<MoviePage>> items;

  @override
  void initState() {
    items = fetchMovie();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
              child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/fondo.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Text('hola'),
          )])),
    ));
  }
  Future<List<MoviePage>> fetchUpFilms() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=d64edfd74101230753aa7b2393ffe8df&language=en-US&page=1'));
    if (response.statusCode == 200) {
      return UpComingResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load films');
    }
  }
}
