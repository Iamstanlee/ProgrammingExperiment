class Station {
  String name, connectors, latitude, longitude, photo, review;
  Station(
      {this.name,
      this.latitude,
      this.connectors,
      this.photo,
      this.review,
      this.longitude});

  Station.fromMap(Map map) {
    this.name = map[''];
    // ...
  }
}
