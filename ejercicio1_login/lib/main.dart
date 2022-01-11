import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
        primarySwatch: Colors.red,
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
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/path_logo.png', width: 400, height: 100),
            const Text(
              'Beautiful, Private Sharing',
              style: TextStyle(color: Color(0X8AFFFFFF), fontSize: 16),
            ),
            Container(
              margin: const EdgeInsets.only(top: (200)),
              child: SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
            ),
            const Text('Already have a Path account?',
            style: TextStyle(color: Color(0X8AFFFFFF), fontSize: 16)
            ),
            Container(
              margin: const EdgeInsets.only(top: (10)),
              child: SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {},
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0XFFE62F16),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}
