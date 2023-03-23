import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:osm_flutter_hooks/osm_flutter_hooks.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // final List<GeoPoint> markers = [
  //   GeoPoint(latitude: 40.7128, longitude: -74.0060), // New York
  //   GeoPoint(latitude: 51.5074, longitude: -0.1278), // London
  //   GeoPoint(latitude: 35.6895, longitude: 139.6917), // Tokyo
  // ];

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

  

  

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(
        child: SimpleOSM(),
      ),
    );
  }
}

class SimpleOSM extends HookWidget {

  SimpleOSM({super.key});

  final List<GeoPoint> markers = [
    GeoPoint(latitude: 21.2514, longitude: 81.6296), // Raipur
    GeoPoint(latitude: 21.1938, longitude: 81.3509), // Bhilai
    GeoPoint(latitude: 21.1904, longitude: 81.2849), // Durg
  ];

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

  get context => null;

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
    // final controller = useMapController(
    //     initMapWithUserPosition: true
    // );
    useMapIsReady(
      controller: mapController,
      mapIsReady: () async {
        await mapController.setZoom(zoomLevel: 15);
      },
    );

    useEffect(() {
      markers.forEach((marker) => mapController.addMarker(marker));
      return () {
        markers.forEach((marker) => mapController.removeMarker(marker));
      };
    }, [mapController]);

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
          // roadConfiguration: RoadOption(
          //   roadColor: Colors.yellowAccent,
          // ),
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
        ),

        Container(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () {

            },
            child: Text("Nearby Messes"),
          ),
        )
      ],
    );
  }
}

