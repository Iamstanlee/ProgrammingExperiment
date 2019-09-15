import 'dart:async';
import 'package:evc/api/place_api.dart';
import 'package:evc/data/place.dart';
import 'package:flutter/widgets.dart';

class SearchBloc with ChangeNotifier {
  var _placeController = StreamController.broadcast();
  PlaceApi _placeApi = PlaceApi();
  Stream get places => _placeController.stream.asBroadcastStream();
  // searchRoute from&to address
  Place _fromAddress, _toAddress;
  String _tag;
  Place get fromAddress => _fromAddress;
  Place get toAddress => _toAddress;
  String get tag => _tag;
  set setTag(String newTag) {
    _tag = newTag;
    notifyListeners();
  }

  set setFromAddress(Place address) {
    _fromAddress = address;
    notifyListeners();
  }

  set setToAddress(Place address) {
    _toAddress = address;
    notifyListeners();
  }

  /// perform search query
  void searchPlace(String keyword, [String searchTag]) {
    setTag = searchTag;
    _placeApi.searchPlaces(keyword).then((res) {
      _placeController.sink.add(res);
    }).catchError(() {
      _placeController.sink.addError('error');
    });
  }

  /// set the user selected address
  /// takes a [tag] param to track the address type for searchRoute
  void setAddress(Place address) {
    if (tag == 'from') {
      setFromAddress = address;
    } else {
      setToAddress = address;
    }
  }

  ///clear the input fields when the user exits the search screen
  void clear() {
    _fromAddress = null;
    _toAddress = null;
    notifyListeners();
  }

  void disposeStream() {
    _placeController.close();
  }
}
