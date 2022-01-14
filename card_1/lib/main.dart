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
          child: Padding(
            padding: const EdgeInsets.only(
                left: CardStyle.bodyPadding, top: CardStyle.bodyPadding2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          '20:55',
                          style: CardStyle.textCiudad,
                        ),
                        Text(
                          'SALIDA',
                          style: CardStyle.subTittle,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(
                                  'MAD',
                                  style: CardStyle.textCiudad,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Madrid',
                                style: CardStyle.textCiudad,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 8),
                              Image.asset(
                                "assets/images/iberia_logo.png",
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Iberia 7448',
                                style: CardStyle.subTittle2,
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Duración 2h 10m',
                            style: CardStyle.subTittle2,
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: CardStyle.bodyPadding,
                      bottom: CardStyle.bodyPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            '20:55',
                            style: CardStyle.textCiudad,
                          ),
                          Text(
                            'SALIDA',
                            style: CardStyle.subTittle,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 110),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(4)),
                                  child: Text(
                                    'LHR',
                                    style: CardStyle.textCiudad,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Londres',
                                  style: CardStyle.textCiudad,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}
