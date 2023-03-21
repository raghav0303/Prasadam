import 'dart:async';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:prasadam/screens/home_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MapController _mapController = MapController();
  LatLng currentLocation1 = LatLng(21.1938, 81.3509);

  // @override
  // void initState() {
  //   super.initState();
  //   _mapController = MapController();
  // }

  Future<void> getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      print("Permissions not given");
      LocationPermission asked = await Geolocator.requestPermission();
    }
    else{
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best
      );
      print("Longitude: " + currentPosition.longitude.toString());
      print("Latitude: " + currentPosition.latitude.toString());

      setState((){
        currentLocation1 = LatLng(currentPosition.longitude, currentPosition.latitude);
        // _mapController.move(currentLocation1, 13.0);
      });

      // currentLocation1 = LatLng(currentPosition.longitude, currentPosition.latitude);
      // point = LatLng(currentPosition.longitude, currentPosition.latitude);
    }
  }

  // LatLng point = LatLng(49.5,-0.09);

  @override
  Widget build(BuildContext context) {



    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: currentLocation1,
            zoom: 10.0
        ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a','b','c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 100.0,
                  height: 100.0,
                  point:
                  currentLocation1,
                  builder: (ctx) => Icon(
                    Icons.location_on,
                    color:Colors.red,
                  )
                )
              ],
            )
          ],
    ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              getCurrentPosition();
            },
            child: Text("Get current position"),
          )
        ),
      ],
    );
  }
}

