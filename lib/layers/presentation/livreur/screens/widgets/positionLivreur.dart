import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionLiveur extends StatefulWidget {
  const PositionLiveur({Key? key}) : super(key: key);

  @override
  _PositionLiveurState createState() => _PositionLiveurState();
}

class _PositionLiveurState extends State<PositionLiveur> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _goToTheLake();
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(33.9715904, -6.8498129),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  bool isMapVisible = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double widght = MediaQuery.of(context).size.width * 0.8;
    return LayoutBuilder(builder: (context, size) {
      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        height: size.maxHeight,
        width: widght * 0.32,
        child: InputDecorator(
          expands: true,
          decoration: InputDecoration(
            labelText: 'Position',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      );
    });
  }
}
