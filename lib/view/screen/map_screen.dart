import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzeria_challenge/viewmodel/map_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GetBuilder<MapViewModel>(
        init: MapViewModel(),
        builder: (controller) => Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition:
              CameraPosition(target: controller.initialcameraposition, zoom: 12),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              onMapCreated: controller.onMapCreated,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
            ),

          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
