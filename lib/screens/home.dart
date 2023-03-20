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

final LatLng raipur = LatLng(21.2514, 81.6296);
final LatLng bhilai = LatLng(21.1938, 81.3509);
final LatLng gwalior = LatLng(26.2124, 78.1772);
late final currentLocation1;

class _HomePageState extends State<HomePage> {
  late final MapController _mapController;
  double _rotation = 0;


  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }


  // late final applicationBloc = Provider.of<ApplicationBloc>(context);
  // final currentLocation = LatLng(21.1938, 81.3509);
  // final CameraPosition _initialPosition = CameraPosition(
  //   target: LatLng(21.1938, 81.3509),
  //   zoom: 15,
  // );
  // GoogleMapController? _controller;
  //
  // Map<String, Marker> _markers = {};

  void getCurrentPosition() async {
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
      currentLocation1 = LatLng(currentPosition.longitude, currentPosition.latitude);
      // point = LatLng(currentPosition.longitude, currentPosition.latitude);
    }
  }

  LatLng point = LatLng(49.5,-0.09);

  @override
  Widget build(BuildContext context) {

    final markers = <Marker>[
      Marker(
        width: 80,
        height: 80,
        point: raipur,
        builder: (ctx) => Container(
          key: const Key('blue'),
          child: const FlutterLogo(),
        ),
      ),
      Marker(
        width: 80,
        height: 80,
        point: bhilai,
        builder: (ctx) => const FlutterLogo(
          key: Key('green'),
          textColor: Colors.green,
        ),
      ),
      Marker(
        width: 80,
        height: 80,
        point: gwalior,
        builder: (ctx) => Container(
          key: const Key('purple'),
          child: const FlutterLogo(textColor: Colors.purple),
        ),
      ),
    ];

    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            // onTap: (p){
            //   setState(() {
            //     point = p;
            //   });
            // },
            center: LatLng(49.5,-0.09),
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
                  point,
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

        MaterialButton(
          onPressed: () {
            _mapController.move(raipur, 18);
          },
          child: const Text('Raipur'),
        ),
        MaterialButton(
          onPressed: () {
            _mapController.move(bhilai, 5);
          },
          child: const Text('Bhilai'),
        ),
        MaterialButton(
          onPressed: () {
            _mapController.move(gwalior, 5);
          },
          child: const Text('Gwalior'),
        ),
        CurrentLocation(mapController: _mapController),
      ],
    );
    // return Scaffold(
    //   body: (applicationBloc.currentLocation == null)
    //       ? Center(
    //     child: CircularProgressIndicator(),
    //   )
    //       : ListView(
    //     children: [
    //       TextField(
    //         decoration: InputDecoration(hintText: 'Search Location'),
    //       ),
    //       Container(
    //           height: 300,
    //           child: GoogleMap(
    //             // initialCameraPosition: _initialPosition,
    //             initialCameraPosition: CameraPosition(
    //                 target: LatLng(applicationBloc.currentLocation!.latitude,
    //                     applicationBloc.currentLocation!.longitude
    //                 )
    //             ),
    //             mapType: MapType.hybrid,
    //             myLocationEnabled: true,
    //             onMapCreated: (controller) {
    //               setState(() {
    //                 _controller = controller;
    //                 // addMarker('test', currentLocation);
    //               });
    //             },
    //             // markers: markers.toSet(),
    //             onTap: (coordinate) {
    //               _controller!
    //                   .animateCamera(CameraUpdate.newLatLng(coordinate));
    //               // addMarker(coordinate);
    //             },
    //             markers: _markers.values.toSet(),
    //           )),
    //     ],
    //   ),
    // );
  }
}

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({
    Key? key,
    required this.mapController,
  }) : super(key: key);

  final MapController mapController;

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  int _eventKey = 0;

  IconData icon = Icons.gps_not_fixed;
  late final StreamSubscription<MapEvent> mapEventSubscription;

  @override
  void initState() {
    super.initState();
    mapEventSubscription =
        widget.mapController.mapEventStream.listen(onMapEvent);
  }

  @override
  void dispose() {
    mapEventSubscription.cancel();
    super.dispose();
  }

  void setIcon(IconData newIcon) {
    if (newIcon != icon && mounted) {
      setState(() {
        icon = newIcon;
      });
    }
  }

  void onMapEvent(MapEvent mapEvent) {
    if (mapEvent is MapEventMove && mapEvent.id != _eventKey.toString()) {
      setIcon(Icons.gps_not_fixed);
    }
  }

  void _moveToCurrent() async {
    _eventKey++;
    // final location = Location();

    try {
      // final currentLocation = await location.getLocation();
      final currentLocation = currentLocation1;
      final moved = widget.mapController.move(
        LatLng(currentLocation.latitude!, currentLocation.longitude!),
        18,
        id: _eventKey.toString(),
      );

      setIcon(moved ? Icons.gps_fixed : Icons.gps_not_fixed);
    } catch (e) {
      setIcon(Icons.gps_off);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: _moveToCurrent,
    );
  }
}