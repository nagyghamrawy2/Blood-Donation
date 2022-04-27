import 'package:intl/intl.dart';

class ProfileModel {
  bool? status;
  String? message;
  User? user;

  ProfileModel.fromJson(Map<String, dynamic> json){
    status= json["status"];
    message= json["message"];
    user= User.fromJson(json["user"]);
  }
}

class User {

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  var dateOfBirth;
  dynamic profilePicture;
  String? bloodType;
  dynamic height;
  dynamic weight;
  Governorate? governorate;
  City? city;

  User.fromJson(Map<String, dynamic> json){
    id= json["id"];
    name= json["name"];
    email= json["email"];
    phoneNumber= json["phone_number"];
    dateOfBirth= DateFormat('yyyy-MM-dd').format(DateTime.parse(json["date_of_birth"]));
    profilePicture= json["profile_picture"];
    bloodType= json["blood_type"];
    height= json["height"];
    weight= json["weight"];
    governorate= Governorate.fromJson(json["governorate"]);
    city= City.fromJson(json["city"]);
  }
}

class City {
  int? id;
  String? cityName;

  City.fromJson(Map<String, dynamic> json){
    id= json["id"];
    cityName= json["city_name"];
  }

}

class Governorate {
  int? id;
  String? governorateName;

  Governorate.fromJson(Map<String, dynamic> json){
    id= json["id"];
    governorateName= json["governorate_name"];
  }
}
