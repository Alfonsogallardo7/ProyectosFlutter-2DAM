import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar/models/episodes_response.dart';
import 'package:http/http.dart' as http;


class EspisodesPages extends StatefulWidget {
  const EspisodesPages({ Key? key }) : super(key: key);

  @override
  _EspisodesPagesState createState() => _EspisodesPagesState();
}

class _EspisodesPagesState extends State<EspisodesPages> {
  late Future<List<Episode>> items;

  @override
  void initState() {
    items = fetchEpisodes();
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        color: Colors.transparent,
                        child: SizedBox(
                          height: 550,
                          child: FutureBuilder<List<Episode>>(
                              future: items,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _episodeList(snapshot.data!);
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

  Future<List<Episode>> fetchEpisodes() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/episode'));
    if (response.statusCode == 200) {
      return EpisodesResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load location');
    }
  }

  Widget _episodeList(List<Episode> episodeList) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: episodeList.length,
      itemBuilder: (context, index) {
        return _episodeItem(episodeList.elementAt(index));
      },
    );
  }

    Widget _episodeItem(Episode episode) {
    return Opacity(
      opacity: 0.5,
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all( 8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    episode.episode,
                    style: const TextStyle(fontFamily: 'Rick', color: Colors.black,),
                  ),
                  Text(
                    episode.name,
                    style: const TextStyle(fontFamily: 'Rick', color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}