import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar/models/location_response.dart';
import 'package:http/http.dart' as http;

class LocationPages extends StatefulWidget {
  const LocationPages({Key? key}) : super(key: key);

  @override
  _LocationPagesState createState() => _LocationPagesState();
}

class _LocationPagesState extends State<LocationPages> {
  late Future<List<Location>> items;

  @override
  void initState() {
    items = fetchLocations();
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
                          child: FutureBuilder<List<Location>>(
                              future: items,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _locationsList(snapshot.data!);
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

  Future<List<Location>> fetchLocations() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/location'));
    if (response.statusCode == 200) {
      return LocationResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load location');
    }
  }

  Widget _locationsList(List<Location> locationList) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: locationList.length,
      itemBuilder: (context, index) {
        return _locationItem(locationList.elementAt(index), index);
      },
    );
  }

  Widget _locationItem(Location location, int index) {
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
                    location.name,
                    style: const TextStyle(fontFamily: 'Rick', color: Colors.black,),
                  ),
                  Text(
                    location.type,
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
