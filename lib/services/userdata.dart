class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? phoneNumber;

  // String? password;
  UserModel({
    this.uid,
    this.email,
    this.firstname,
    this.phoneNumber,
  });

  // Data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map["uid"],
        email: map["email"],
        firstname: map["firstname"],
        phoneNumber: map["phoneNumber"]);
  }

  // Sending data to server
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "firstname": firstname,
      "phoneNumber": phoneNumber
    };
  }
}
