import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meteor_app/styles.dart';
import 'package:meteor_app/utils/constanst.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeleccionarMapar extends StatefulWidget {
  const SeleccionarMapar({Key? key}) : super(key: key);

  @override
  _SeleccionarMaparState createState() => _SeleccionarMaparState();
}

LatLng coordenada = LatLng(37.379647, -6.0069196);

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
                child: GoogleMap(
                  initialCameraPosition: _initialCameraPosition,
                  myLocationButtonEnabled: false,
                  markers: <Marker>{
                    _createMarker(),
                  },
                  onTap: (LatLng position) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setDouble('lat', position.latitude);
                    prefs.setDouble('lng', position.longitude);
                    setState(() {
                      coordenada = position;
                    });
                    print(position);
                  },
                ),
              )
            ])));
  }

  Marker _createMarker() {
    return Marker(
      markerId: MarkerId("marker_1"),
      position: coordenada,
    );
  }
}
