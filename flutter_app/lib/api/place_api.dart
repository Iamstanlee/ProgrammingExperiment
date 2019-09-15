import 'package:dio/dio.dart';
import 'package:evc/api/api.dart';
import 'package:evc/data/place.dart';

class PlaceApi extends Api {
  Dio dio = new Dio();
  Future<List<Place>> searchPlaces(String keyword) async {
    var places = <Place>[];
    try {
      dio
          .get(
              "https://maps.googleapis.com/maps/api/place/textsearch/json?key=$apiKey&language=$language&region=$region&query=" +
                  Uri.encodeQueryComponent(keyword))
          // .get(
          //     "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${Uri.encodeQueryComponent(keyword)}&language=$language&key=$apiKey")
          .then((res) {
        res.data['results'].forEach((data) {
          places.add(Place.fromMap(data));
        });
        // res.data['predictions'].forEach((data) {
        //   places.add(Place.fromMap(data));
        // });
      });
    } catch (e) {
      return e.message;
    }
    return places;
  }
}
