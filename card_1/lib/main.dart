import 'package:card_1/styles.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(CardStyle.bodyPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '20:55',
                          style: CardStyle.textCiudad,
                        ),
                        Text(
                          'SALIDA',
                          style: CardStyle.textCiudad,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'MAD',
                    style: CardStyle.textCiudad,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Madrid',
                    style: CardStyle.textCiudad,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/iberia_logo.png",
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Iberia 7448',
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(width: 8),
                  Text('Duración 2h 10m'),
                  SizedBox(width: 8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(CardStyle.bodyPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '22:05',
                          style: CardStyle.textCiudad,
                        ),
                        Text(
                          'LLEGADA',
                          style: CardStyle.textCiudad,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'LHR',
                    style: CardStyle.textCiudad,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Londres',
                    style: CardStyle.textCiudad,
                  ),
                  const SizedBox(width: 8),
                ],
              ),

              /*SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: 100,
                child: Text(
                  'Madrid',
                  style: CardStyle.textCiudad,
                ),
              ),*/
            ],
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}
