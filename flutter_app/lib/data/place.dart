class Place {
  String name;
  String address;
  double lat;
  double lng;
  Place(this.name, this.address, this.lat, this.lng);

  Place.fromMap(Map map) {
    name = map['name'];
    address = map['formatted_address'];
    lat = map['geometry']['location']['lat'];
    lng = map['geometry']['location']['lng'];
  }
  // autocomplete
  // Place.fromMap(Map map) {
  //   name = map['description'];
  //   address = map['formatted_address'];
  //   lat = map['geometry']['location']['lat'];
  //   lng = map['geometry']['location']['lng'];
  // }
}
