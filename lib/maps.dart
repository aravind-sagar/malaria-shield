import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MapPage extends StatefulWidget {
  static const LatLng sourceLocation = LatLng(26.132200, 28.118940);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  LocationData? currentLocation;

  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Map',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: currentLocation == null
          ? const Center(child: Text("Loading..."))
          : GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!), zoom: 14.5),
              markers: {
                Marker(
                  markerId: MarkerId("currentLocation"),
                  position: LatLng(
                    currentLocation!.latitude!, currentLocation!.longitude!
                  )
                ),
                Marker(
                  markerId: MarkerId("source"),
                  position: MapPage.sourceLocation,
                ),
              },
            ),
    );
  }
}