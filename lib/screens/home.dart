import 'package:flutter/material.dart';
import 'package:prasadam/screens/home_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
    options: MapOptions(
        center: latLng.LatLng(21.1938, 81.3509),
        zoom: 9.2,
    ),
    nonRotatedChildren: [
        AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
        ),
    ],
    children: [
        TileLayer(
            urlTemplate: 'https://api.mapbox.com/styles/v1/raghavjoshi03/clalvihxb000514o68pjwdzby/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmFnaGF2am9zaGkwMyIsImEiOiJjbDJycW91c3cxd3dxM2Jrem1mczV3ZXRqIn0.YEIXcheELO9KHKgPjb7S8g',
            userAgentPackageName: 'com.example.app',
            additionalOptions: {
              'accessToken':'pk.eyJ1IjoicmFnaGF2am9zaGkwMyIsImEiOiJjbDJycW91c3cxd3dxM2Jrem1mczV3ZXRqIn0.YEIXcheELO9KHKgPjb7S8g',
              'id' : 'mapbox.satellite',
            }
        ),
    ],
)
    );
  }
}