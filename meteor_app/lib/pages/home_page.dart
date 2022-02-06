import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meteor_app/pages/prediccion_tierra_principal.dart';
import 'package:meteor_app/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    PrediccionTierraPrincipal(),
    Text('data'),
    Text('data'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/world.svg',
                height: 25,
                width: 25,
              ),
              label: 'Tierra',
              activeIcon: SvgPicture.asset(
                'assets/icons/globe_tapped.svg',
                height: 25,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/marte.svg',
                height: 25,
                width: 25,
              ),
              label: 'Marte',
              activeIcon: SvgPicture.asset(
                'assets/icons/marte_tapped.svg',
                height: 25,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/lista.svg',
                height: 25,
                width: 25,
              ),
              label: 'Ajustes',
              activeIcon: SvgPicture.asset(
                'assets/icons/lista_tapped.svg',
                height: 25,
              )),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.deepPurple[800],
        unselectedItemColor: Colors.grey,
        backgroundColor: MeteorAppStyle.colorAzul,
        onTap: _onItemTapped,
      ),
    );
  }
}
