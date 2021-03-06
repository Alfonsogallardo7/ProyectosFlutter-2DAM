import 'package:flutter/material.dart';
import 'package:flutter_miarmapp/repository/preferences.dart';
import 'package:flutter_miarmapp/ui/screens/login_screen.dart';
import 'package:flutter_miarmapp/ui/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiarmApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
  routes: {
    '/': (context) => const LoginScreen(),
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
  },
    );
  }
}