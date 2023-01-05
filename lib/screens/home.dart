// import 'dart:html';
import 'dart:math';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prasadam/blocs/application_bloc.dart';
// import 'package:prasadam/screens/home_screen.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart' as latLng;

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final applicationBloc = Provider.of<ApplicationBloc>(context);
  final currentLocation = LatLng(21.1938, 81.3509);
  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(21.1938, 81.3509),
    zoom: 15,
  );
  GoogleMapController? _controller;

  Map<String, Marker> _markers = {};
  // final List<Marker> markers = [];

  // addMarker(coordinate){
  //   int id = Random().nextInt(100);
  //   setState(() {
  //     markers.add(Marker(position: coordinate, markerId: MarkerId(id.toString())));
  //   });
  // }

  // String location = 'Bhilai';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 33, 32, 32),
//         title: const Text('Flutter MapBox'),
//       ),
//       body: Stack(
//         children: [
//           FlutterMap(
//             options: MapOptions(
//               minZoom: 5,
//               maxZoom: 18,
//               zoom: 13,
//               center: latLng.LatLng(21.1938, 81.3509),
//             ),

//             nonRotatedChildren: [
//               AttributionWidget.defaultWidget(
//               source: 'OpenStreetMap contributors',
//               onSourceTapped: null,
//               ),
//             ],
//             children: [

//             Column(
//               children: [
//                 Container(
//                 width: 300,
//                 child: TextField(
//                 style: TextStyle(color: Colors.white, fontSize: 25),
//                 decoration: InputDecoration(
//                   hintText: 'Search another location...',
//                   hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
//                   prefixIcon: Icon(Icons.search, color: Colors.white),
//                 ),
//             )
//             )
//         ],
//         ),

//       TileLayer(
//             urlTemplate: 'https://api.mapbox.com/styles/v1/raghavjoshi03/clalvihxb000514o68pjwdzby/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmFnaGF2am9zaGkwMyIsImEiOiJjbDJycW91c3cxd3dxM2Jrem1mczV3ZXRqIn0.YEIXcheELO9KHKgPjb7S8g',
//             userAgentPackageName: 'com.example.app',
//             additionalOptions: {
//               'accessToken':'pk.eyJ1IjoicmFnaGF2am9zaGkwMyIsImEiOiJjbDJycW91c3cxd3dxM2Jrem1mczV3ZXRqIn0.YEIXcheELO9KHKgPjb7S8g',
//               'id' : 'mapbox.satellite',
//             }
//         ),
//     ],
// )
//         ],
//       )
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (applicationBloc.currentLocation == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Search Location'),
                ),
                Container(
                    height:300,
                    child: GoogleMap(
                      // initialCameraPosition: _initialPosition,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(applicationBloc.currentLocation!.latitude,
                        applicationBloc.currentLocation!.longitude
                        ) 
                        ),
                      mapType: MapType.hybrid,
                      myLocationEnabled: true,
                      onMapCreated: (controller) {
                        setState(() {
                          _controller = controller;
                          // addMarker('test', currentLocation);
                        });
                      },
                      // markers: markers.toSet(),
                      onTap: (coordinate) {
                        _controller!
                            .animateCamera(CameraUpdate.newLatLng(coordinate));
                        // addMarker(coordinate);
                      },
                      markers: _markers.values.toSet(),
                    )),
              ],
            ),
    );
  }

  // addMarker(String id, LatLng location) async {
  // //   var markerIcon = await BitmapDescriptor.fromAssetImage(
  // //       const ImageConfiguration(), 'assets/images/logo5_circle_cropped.png');

  //   // var url = ''; //url from where we will be fetching our image
  //   // var bytes = (await NetworkAssetBundle(Uri().parse(url)).load(url)).buffer.asUint8List();

  //   var marker = Marker(
  //     markerId: MarkerId(id),
  //     position: location,
  //     infoWindow: const InfoWindow(
  //       title: 'Title of place',
  //       snippet: 'Some description of the place',
  //     ),
  //     // icon: markerIcon,
  //     // icon: BitmapDescriptor.fromBytes(bytes),
  //   );

  //   _markers[id] = marker;
  //   setState(() {});
  // }
}

// class MapMarker {
//   final String? image;
//   final String? title;
//   final String? address;
//   final latLng.LatLng? location;
//   final int? rating;

//   MapMarker({
//     required this.image,
//     required this.title,
//     required this.address,
//     required this.location,
//     required this.rating,
//   });
// }

// final mapMarkers = [
//   MapMarker(
//       image: 'assets/images/restaurant_1.jpg',
//       title: 'Alexander The Great Restaurant',
//       address: '8 Plender St, London NW1 0JT, United Kingdom',
//       location: latLng.LatLng(21.196794, 81.303288),
//       rating: 4),
//   MapMarker(
//       image: 'assets/images/restaurant_2.jpg',
//       title: 'Mestizo Mexican Restaurant',
//       address: '103 Hampstead Rd, London NW1 3EL, United Kingdom',
//       location: latLng.LatLng(51.5090229, -0.2886548),
//       rating: 5),
//   MapMarker(
//       image: 'assets/images/restaurant_3.jpg',
//       title: 'The Shed',
//       address: '122 Palace Gardens Terrace, London W8 4RT, United Kingdom',
//       location: latLng.LatLng(51.5090215, -0.1959988),
//       rating: 2),
//   MapMarker(
//       image: 'assets/images/restaurant_4.jpg',
//       title: 'Gaucho Tower Bridge',
//       address: '2 More London Riverside, London SE1 2AP, United Kingdom',
//       location: latLng.LatLng(51.5054563, -0.0798412),
//       rating: 3),
//   MapMarker(
//     image: 'assets/images/restaurant_5.jpg',
//     title: 'Bill\'s Holborn Restaurant',
//     address: '42 Kingsway, London WC2B 6EY, United Kingdom',
//     location: latLng.LatLng(51.5077676, -0.2208447),
//     rating: 4,
//   ),
// ];
