import 'package:flutter/material.dart';
import 'package:meteor_app/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                        "assets/images/fondo_estrellas.png",
                      ),
                      fit: BoxFit.cover)),
            ),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Personajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Localizaciones',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.cloud_download,
              ),
              label: 'DN'),
        ],
        //currentIndex: _selectIndex,

        selectedItemColor: Colors.deepPurple[800],
        unselectedItemColor: Colors.grey,
        backgroundColor: MeteorAppStyle.colorAzul,
        //onTap: _onItemTapped,
      ),
    );
  }
}