import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meteor_app/styles.dart';

class SeleccionarMapar extends StatefulWidget {
  const SeleccionarMapar({Key? key}) : super(key: key);

  @override
  _SeleccionarMaparState createState() => _SeleccionarMaparState();
}

class _SeleccionarMaparState extends State<SeleccionarMapar> {
  final _initialCameraPosition =
      CameraPosition(target: LatLng(37.379647, -6.0069196), zoom: 15);
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
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)),
                  width: 300,
                  height: 300,
                  child: GoogleMap(
                    initialCameraPosition: _initialCameraPosition,
                    onTap: (position) {
                      print(position);
                    },
                  ),
                ),
              )
            ])));
  }
}
