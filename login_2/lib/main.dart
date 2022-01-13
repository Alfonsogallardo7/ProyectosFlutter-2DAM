import 'package:flutter/material.dart';
import 'package:login_2/styles.dart';

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
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fondo_login2.png'),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                top: 30,
                right: 30,
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: LoginStyle.bodyPadding,
                        right: LoginStyle.bodyPadding),
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Skip',
                          style: LoginStyle.textTittle,
                        )))),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/red-bull-logo.png',
                    width: 500,
                    height: 270,
                  )
                ],
              ),
            )

            /*Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),*/
          ],
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
