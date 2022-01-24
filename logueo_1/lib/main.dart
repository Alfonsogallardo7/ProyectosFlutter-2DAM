import 'package:flutter/material.dart';
import 'package:logueo_2/pages/sign_in.dart';
import 'package:logueo_2/styles.dart';

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
        backgroundColor: LoginStyle.colorFondo,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: 450,
                    height: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/fondo.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 25),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Discover your',
                        style: LoginStyle.textTittle,
                      ),
                      Text(
                        'Dream job Here',
                        style: LoginStyle.textTittle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Explore all the most exiting jobs roles',
                          style: LoginStyle.textSubTittle,
                        ),
                      ),
                      Text(
                          'based on your interest And study major',
                          style: LoginStyle.textSubTittle,
                        ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[400],
                  ),
                  margin: const EdgeInsets.all(40),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(children: <Widget>[
                    Row(
                      children: [
                        Flexible(flex: 1, child: Container(color: Colors.grey)),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[400],
                            ),
                            alignment: Alignment.center,
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: GestureDetector(
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SingIn()));},
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFF212121)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      height: 70,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: GestureDetector(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SingIn()));},
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF212121),),
                        ),
                      ),
                    ),
                  ]),
                ),
              ]),
          /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
        ));
  }
}
