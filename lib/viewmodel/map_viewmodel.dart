import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location_permissions/location_permissions.dart';

class MapViewModel extends GetxController {
  LatLng initialcameraposition = LatLng(31.995368, 35.8607009);

  LatLng _currentLocation = LatLng(31.995368, 35.8607009);

  GoogleMapController _controller;

  Location _location = Location();

  @override
  void onInit() {
    requestPermision();
    super.onInit();
  }

  void onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _currentLocation = LatLng(l.latitude, l.longitude);
    });
    try {
      _controller
          .animateCamera(CameraUpdate.newLatLngZoom(_currentLocation, 15));
    } on Exception catch (e) {
    }
    update();
  }

  void requestPermision() async {
    await LocationPermissions().requestPermissions();
  }
}
