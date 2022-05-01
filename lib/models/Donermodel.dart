class DonarModel {
  bool? status;
  String? message;
  late List<User> users;

  DonarModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    users = List<User>.from(json["users"].map((x) => User.fromJson(x)));
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  DateTime? dateOfBirth;
  String? profilePicture;
  String? bloodType;
  int? height;
  String? weight;
  Governorate? governorate;
  City? city;

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    dateOfBirth = DateTime.parse(json["date_of_birth"]);
    profilePicture = json["profile_picture"] == null ? null : json["profile_picture"];
    bloodType = json["blood_type"];
    height = json["height"];
    weight = json["weight"] == null ? null : json["weight"];
    governorate = Governorate.fromJson(json["governorate"]);
    city = City.fromJson(json["city"]);
  }
}

class City {
  int? id;
  String? cityName;

  City.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    cityName = json["city_name"];
  }
}

class Governorate {
  int? id;
  String? governorateName;

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    governorateName = json["governorate_name"];
  }
}
