import 'dart:ui';

import 'package:card_2/styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: CardStyle.bodyPadding,
                    top: CardStyle.bodyPadding2,
                    right: CardStyle.bodyPadding,
                    bottom: CardStyle.bodyPadding),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'El más barato, Buena puntuación',
                          style: CardStyle.textPuntuacion,
                        ),
                        Text(
                          '45 ofertas',
                          style: CardStyle.textOfertas,
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/images/coche.png',
                      height: 220,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Todoterreno',
                              style: CardStyle.textTittle,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: CardStyle.smallBodyPadding),
                              child: Text(
                                '5 puertas · Range Rover Velar',
                                style: CardStyle.textOfertas,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: CardStyle.smallBodyPadding),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const Icon(
                                    Icons.directions_car,
                                    size: 17,
                                  ),
                                  const Text(' Man. '),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const <Widget>[
                                            Icon(
                                              Icons.ac_unit,
                                              size: 17,
                                            ),
                                            Text(' A/A '),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const <Widget>[
                                            Icon(
                                              Icons.person,
                                              size: 17,
                                            ),
                                            Text(' 4 '),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const <Widget>[
                                            Icon(
                                              Icons.work,
                                              size: 17,
                                            ),
                                            Text(' 1 '),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: CardStyle.bodyPadding2,
                    bottom: CardStyle.bodyPadding,
                    right: CardStyle.bodyPadding,
                    left: CardStyle.bodyPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('54€', style: CardStyle.textInferior,), Text('SELECCIONAR', style: CardStyle.textInferior,)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
