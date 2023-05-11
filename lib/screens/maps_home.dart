import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Package:prasadam/model/coordinates.dart';
import 'Package:prasadam/model/fetch_coordinates.dart';

class MyMapPage extends StatefulWidget {
  const MyMapPage({Key? key}) : super(key: key);

  @override
  State<MyMapPage> createState() => _MyMapPageState();
}

LatLng currentLocation = LatLng(21.1938, 81.3509);

class _MyMapPageState extends State<MyMapPage> {

  List<Coordinate> _coordinates = [];

  // @override
  // void initState() {
  //   super.initState();
  //
  // }



  final databaseReference = FirebaseDatabase.instance.ref().child('');

  List<Marker> _nearbyMarkers = [];


  MapController _mapController = MapController();
  final PopupController _popupController = PopupController();


  final List<LatLng> _latLngList = [
    LatLng(21.194383, 81.301330),
    LatLng(21.194203, 81.299452),
    LatLng(21.195288, 81.298427),
  ];

  late LatLng _tappedPosition = LatLng(21.1938,81.3509);

  late final List<Marker> _markers = _latLngList
      .map((point) => Marker(
    point: point,
    width: 60,
    height: 60,
    builder: (context) => const Icon(
      Icons.location_on,
      size: 60,
      color: Colors.blueAccent,
    ),
  ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
          backgroundColor: Colors.brown,
        ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(

                onTap: (tapPos, LatLng latLng) {
                  print("TAP $tapPos    $latLng");
                  setState(() {
                    // _tappedPosition.add(
                    // _markers.add(
                    //   Marker(
                    //     width: 150.0,
                    //     height: 150.0,
                    //     point: latLng,
                    //     builder: (ctx) => const Icon(
                    //       Icons.location_on,
                    //       color: Colors.red,
                    //       size: 35.0,
                    //     ),
                    //   ),
                    // );
                    _tappedPosition = latLng;
                  });
                  print(_tappedPosition);
                },
                center: currentLocation,
                zoom: 15.0
            ),
            // layers: [
            //   TileLayerOptions(
            //     minZoom: 1,
            //     maxZoom: 18,
            //     backgroundColor: Colors.black,
            //     urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            //     subdomains: ['a', 'b', 'c'],
            //   ),

            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              // MarkerLayer(markers: _markers)
              MarkerLayer(
                markers: [
                  Marker(
                      width: 150.0,
                      height: 150.0,
                      point: _tappedPosition,
                      builder: (context) => IconButton(
                          icon: const Icon(Icons.location_on),
                          color: Colors.red,
                          iconSize: 45.0,
                          onPressed: () {
                            print('Position tapped');
                            fetchCoordinates(100.0).then((coordinates) {
                              setState(() {
                                _coordinates = coordinates;
                              });
                            });
                            _getNearbyMarkers(_tappedPosition);
                          }
                      )
                  )
                ],
              ),
              MarkerClusterLayerWidget(
                options: MarkerClusterLayerOptions(

                  maxClusterRadius: 190,
                  disableClusteringAtZoom: 16,
                  size: const Size(50, 50),
                  fitBoundsOptions: const FitBoundsOptions(
                    padding: EdgeInsets.all(50),
                  ),

                  // markers: _markers,
                  markers: _nearbyMarkers,

                  polygonOptions: const PolygonOptions(
                      borderColor: Colors.blueAccent,
                      color: Colors.black12,
                      borderStrokeWidth: 3),

                  builder: (context, markers) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.orange, shape: BoxShape.circle),
                      child: Text('${markers.length}'),
                    );
                  },

                  // popupOptions: PopupOptions(
                  //   popupState: ,
                  // popupSnap: PopupSnap.markerTop,
                  // popupController: _popupController,
                  // popupBuilder: (_, marker) => Container(
                  // alignment: Alignment.center,
                  // height: 50,
                  // width: 50,
                  // decoration: BoxDecoration(
                  // color: Colors.black, shape: BoxShape.rectangle),
                  // child: Text(
                  // 'Popup',
                  // style: TextStyle(color: Colors.white),
                  // ),
                  // )),
                ),
              ),
              PopupMarkerLayerWidget(
                options: PopupMarkerLayerOptions(
                    popupController: _popupController,

                    // markers: _markers,
                    // markers: _nearbyMarkers,
                    markers: _coordinates.map((coordinate) {
                      return Marker(
                        point: LatLng(coordinate.latitude, coordinate.longitude),
                        builder: (context) => IconButton(
                            icon: const Icon(Icons.location_on),
                            color: Colors.blue,
                            iconSize: 45.0,
                            onPressed: () {
                              // print('Position tapped');
                              // _getNearbyMarkers(_tappedPosition);
                            }
                        ),
                      );
                    }).toList(),

                    markerRotateAlignment:
                    PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
                    popupBuilder: (BuildContext context, Marker marker) {
                      // ExamplePopup(marker),
                      return Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.rectangle),
                        child: const Text(
                          'Popup',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                ),
              ),

              // Container(
              //   alignment: Alignment.bottomCenter,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       _getNearbyMarkers(_tappedPosition);
              //     },
              //     child: Text("Show Nearby Messes"),
              //   ),
              // ),
            ],
          ),
        ],
      )
    );
  }

  _getNearbyMarkers(LatLng point) {

  }

}

