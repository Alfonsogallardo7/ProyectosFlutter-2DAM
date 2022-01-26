import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('dff'),
    Text('data'),
    Text('data'),
    Text('data'),
    /*PersonajesPages(),
    LocationPages(),
    EspisodesPages()*/
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Personajes'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Localizaciones',
          ),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.cloud_download,
            
          ),
          label: 'DN'),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.notifications,
            
          ),
          label: 'DN')
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
