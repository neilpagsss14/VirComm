import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  void initState() {
    super.initState();

    marker1();
    marker2();
    marker3();
  }

  final Completer<GoogleMapController> _controller = Completer();
  static CameraPosition myLocation = const CameraPosition(
    target: LatLng(8.481828, 124.646717),
    zoom: 16,
  );

  Set<Marker> markers = {};

  marker1() async {
    Marker mark1 = const Marker(
        markerId: MarkerId('mark1'),
        infoWindow: InfoWindow(
          title: 'Your Location',
        ),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(8.481828, 124.646717));

    setState(() {
      markers.add(mark1);
    });
  }

  marker2() async {
    Marker mark2 = const Marker(
        markerId: MarkerId('mark2'),
        infoWindow: InfoWindow(
          title: 'Evacuation Area 1',
        ),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(8.484829, 124.647908));

    setState(() {
      markers.add(mark2);
    });
  }

  marker3() async {
    Marker mark3 = const Marker(
        markerId: MarkerId('mark3'),
        infoWindow: InfoWindow(
          title: 'Evacuation Area 2',
        ),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(8.481426, 124.646726));

    setState(() {
      markers.add(mark3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        zoomControlsEnabled: false,
        markers: Set<Marker>.from(markers),
        mapType: MapType.normal,
        initialCameraPosition: myLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
