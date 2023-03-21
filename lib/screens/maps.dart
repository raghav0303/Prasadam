import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // MapController mapController = MapController.withPosition(
  //   initPosition: GeoPoint(
  //     latitude: 21.1938,
  //     longitude: 81.3509
  //     ),
  //   areaLimit: BoundingBox(
  //     east: 10.4922941,
  //     north: 47.8084648,
  //     south: 45.817995,
  //     west:  5.9559113,
  //   ),
  // );

  MapController mapController = MapController(
    initMapWithUserPosition: false,
    initPosition: GeoPoint(latitude: 21.1938, longitude: 81.3509),
    areaLimit: BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west:  5.9559113,
    ),
  );

  // mapController.dispose();

  getCurrentLocation() async{
    await mapController.currentLocation();
  }

  locationPicker() async{
    GeoPoint? p = await showSimplePickerLocation(
      context: context,
      isDismissible: true,
      title: "Location Picker",
      textConfirmPicker: "pick",
      initCurrentUserPosition: true,
    );

    // mapController.dispose();

    await mapController.changeLocation(p!);
  }

  @override
  Widget build(BuildContext context) {



    return Stack(
      children: [
      OSMFlutter(
      controller:mapController,
      trackMyPosition: false,
      initZoom: 12,
      minZoomLevel: 3,
      maxZoomLevel: 19,
      stepZoom: 1.0,
      userLocationMarker: UserLocationMaker(
        personMarker: MarkerIcon(
          icon: Icon(
            Icons.location_history_rounded,
            color: Colors.red,
            size: 100,
          ),
        ),
        directionArrowMarker: MarkerIcon(
          icon: Icon(
            Icons.double_arrow,
            size: 48,
          ),
        ),
      ),
      roadConfiguration: RoadOption(
        roadColor: Colors.yellowAccent,
      ),
      // markerOption: MarkerOption(
      //     defaultMarker: MarkerIcon(
      //       icon: Icon(
      //         Icons.person,
      //         color: Colors.blue,
      //         size: 56,
      //       ),
      //     )
      // ),
    ),

    Container(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        child: Icon(Icons.gps_fixed),
        onPressed: () {
          getCurrentLocation();
        },
      ),
    ),

        Container(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              locationPicker();
            },
            child: Text("Pick Location"),
          ),
        )
      ],
    );
  }
}
