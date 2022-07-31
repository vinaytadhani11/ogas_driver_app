// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use, unnecessary_null_comparison, depend_on_referenced_packages, prefer_interpolation_to_compose_strings, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

final TextEditingController searchlocationcontroller = TextEditingController();
final TextEditingController flatcontroller = TextEditingController();
final TextEditingController landmarkcontroller = TextEditingController();
String googleApikey = "AIzaSyAcC0VIBTRTqLZZZMs97SNy8_lJhjEoDXA";
GoogleMapController? mapController;
CameraPosition? cameraPosition;
String location = "Search Location";
List<Marker> markers = <Marker>[];
Set<Circle> circles = <Circle>{};
double? lat;
double? lng;

class _MapScreenState extends State<MapScreen> {
  LatLng currentPostion = LatLng(22.309425, 72.136230);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: currentPostion,
          zoom: 14.0,
          // tilt: 20,∂∂
        ),
        // markers: Set<Marker>.of(markers),
        // circles: circles,
        trafficEnabled: true,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(
            () {
              mapController = controller;
            },
          );
        },
      ),
    );
  }
}
