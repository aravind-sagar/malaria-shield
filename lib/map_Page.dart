import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapPage extends StatefulWidget {
  @override
  State<mapPage> createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  static const LatLng _position = LatLng(15.49770, 73.81929);
  static const LatLng _posi = LatLng(15.52632, 73.82701);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _position,
          zoom: 12,
        ),
        markers: {
          Marker(
            markerId: MarkerId("_currentLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _position,
          )
        },
      ),
    );
  }
}
