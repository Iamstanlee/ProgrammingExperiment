import 'package:evc/api/map_api.dart';
import 'package:evc/data/station.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBloc with ChangeNotifier {
  GoogleMapController _mapController;
  MapApi _mapApi = MapApi();
  LatLng _myLocation = LatLng(28.6304, 77.2177);
  List<Station> _stations;

  LatLng get myLocation => _myLocation;
  List<Station> get stations => _stations;
  set setStations(List<Station> stations) {
    _stations = stations;
    notifyListeners();
  }

  ///move the map position to the user current location
  void moveCameraToMyLocation() {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_myLocation != null ? _myLocation.latitude : 0.0,
              _myLocation != null ? _myLocation.longitude : 0.0),
          zoom: 15.0,
        ),
      ),
    );
  }

  void getStations() async {
    setStations = await _mapApi.getStations();
  }
}
