class User {
  String id;
  String email;
  String name;
  String profilePhoto;

  User({this.name, this.id, this.email, this.profilePhoto});
  User.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        email = data['email'],
        name = data['name'];
}
