import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterBloc with ChangeNotifier {
  int _selectedDistance;
  String _selectedType;
  SharedPreferences _sharedPreferences;

  int get selectedDistance => _selectedDistance;
  String get selectedType => _selectedType;

  void saveDistancePreference(int distance) async {
    await _sharedPreferences.setInt('distance', distance);
  }

  void saveTypePreference(String type) async {
    await _sharedPreferences.setString('type', type);
  }

  int getDistancePreference() {
    return _sharedPreferences.getInt('distance');
  }

  String getTypePreference() {
    return _sharedPreferences.getString('type');
  }

  set setDistance(int distance) {
    _selectedDistance = distance;
    saveDistancePreference(distance);
    notifyListeners();
  }

  set setType(String type) {
    _selectedType = type;
    saveTypePreference(type);
    notifyListeners();
  }
}
