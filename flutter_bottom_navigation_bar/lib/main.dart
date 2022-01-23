import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar/pages/episodes_pages.dart';
import 'package:flutter_bottom_navigation_bar/pages/location_pages.dart';
import 'package:flutter_bottom_navigation_bar/pages/personajes_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    PersonajesPages(),
    LocationPages(),
    EspisodesPages()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'Rick and Morty',
          style:
              TextStyle(fontFamily: 'Rick', color: Colors.blue, fontSize: 30),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Personajes'),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Localizaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Episodios',
          )
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.lightGreenAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
