import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logueo_2/styles.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoginStyle.colorFondo,
      body: Center(
        child: Column(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 80, bottom: 10),
                  child: Text('Hello Again!',style: LoginStyle.textTittle,),),
                  Text('Wellcome back you´ve', style: LoginStyle.textTittle2,),
                  Text('been missed!',style: LoginStyle.textTittle2,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
