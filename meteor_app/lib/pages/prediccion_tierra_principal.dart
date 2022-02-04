import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrediccionTierraPrincipal extends StatefulWidget {
  const PrediccionTierraPrincipal({Key? key}) : super(key: key);

  @override
  _PrediccionTierraPrincipalState createState() =>
      _PrediccionTierraPrincipalState();
}

class _PrediccionTierraPrincipalState extends State<PrediccionTierraPrincipal> {
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
              Text('')
            ])));
  }
}
