import 'dart:math';
import 'package:geo_firestore_flutter/geo_firestore_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prasadam/model/coordinates.dart';
import 'package:prasadam/screens/maps_home.dart';
// import * as geofirestore from 'geofirestore';

Future<List<Coordinate>> fetchCoordinates(double radius) async {

  final center = currentLocation;
  print(currentLocation);

  final double radiusInMeters = radius * 1000; // Convert radius from kilometers to meters
  final double lat = center.latitude;
  final double lng = center.longitude;

  final double latOffset = radiusInMeters / 111319.9; // Approximate distance between one degree of latitude in meters
  final double lngOffset = radiusInMeters / (111319.9 * cos(lat)); // Approximate distance between one degree of longitude in meters, adjusted for latitude

  final double minLat = lat - latOffset;
  final double maxLat = lat + latOffset;
  final double minLng = lng - lngOffset;
  final double maxLng = lng + lngOffset;

  final Map<String, double> bounds = {
    'south': minLat,
    'west': minLng,
    'north': maxLat,
    'east': maxLng,
  };

  // final bounds = /* calculate the bounds of the map based on the center and radius */;
  final query = FirebaseFirestore.instance
      .collection('coordinates')
      .where('latitude', isGreaterThanOrEqualTo: bounds['south'])
      .where('latitude', isLessThanOrEqualTo: bounds['north'])
      .where('longitude', isGreaterThanOrEqualTo: bounds['west'])
      .where('longitude', isLessThanOrEqualTo: bounds['east']);

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // GeoFirestore geoFirestore = GeoFirestore(firestore.collection('coordinates'));

  // Create a GeoQuery based on a location
  // final query = geocollection.near({ center: new firebase.center, radius: 1000 });

  final result = await query.get();
  print("result 1 and 2");
  return result.docs.map((doc) => Coordinate.fromMap(doc.data())).toList();
}
