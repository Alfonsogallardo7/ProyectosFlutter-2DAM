import 'package:flutter/cupertino.dart';
import 'package:popcorn_home_page/models/popular_response.dart';
import 'package:http/http.dart' as http;


class PopularPages extends StatefulWidget {
  const PopularPages({ Key? key }) : super(key: key);

  @override
  _PopularPagesState createState() => _PopularPagesState();
}

class _PopularPagesState extends State<PopularPages> {
  late Future<List<Films>> items;

  @override
  void initState() {
    items = fetchPersonajes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  Future<List<Films>> fetchPersonajes() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    if (response.statusCode == 200) {
      return PersonajesResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load persons');
    }
  }
}