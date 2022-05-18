import 'package:intl/intl.dart';

class ProfileModel {
  bool? status;
  String? message;
  User? user;
  Errors? errors;


  ProfileModel.fromJson(Map<String, dynamic> json){
    status= json["status"];
    message= json["message"];
    user= json['user'] != null ? User.fromJson(json["user"]): null;
    errors= json['errors'] != null ? Errors.fromJson(json["errors"]) : null;
  }
}

class User {

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? availableForDonate;
  var dateOfBirth;
  var donationDate;
  dynamic profilePicture;
  String? bloodType;
  int? height;
  String? weight;
  Governorate? governorate;
  City? city;
  String? token;
  String? fcmToken;


  User.fromJson(Map<String, dynamic> json){
    id= json["id"];
    name= json["name"];
    email= json["email"];
    phoneNumber= json["phone_number"];
    availableForDonate = json['available_for_donate'];
    dateOfBirth= DateFormat('yyyy-MM-dd').format(DateTime.parse(json["date_of_birth"]));
    donationDate= DateFormat('yyyy-MM-dd').format(DateTime.parse(json["last_donate_time"]));
    profilePicture= json["profile_picture"];
    bloodType= json["blood_type"];
    height= json["height"];
    weight= json["weight"];
    governorate= Governorate.fromJson(json["governorate"]);
    city= City.fromJson(json["city"]);
    token= json["token"];
    fcmToken= json["fcm_token"];

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

class Errors {
  List<String>? name;
  List<String>? email;
  List<String>? phoneNumber;
  List<String>? dateOfBirth;
  List<String>? bloodType;
  List<String>? governorateId;
  List<String>? cityId;
  List<String>? fcmToken;


  Errors.fromJson(Map<String, dynamic> json){
    name= json['name'] != null ? List<String>.from(json["name"].map((x) => x)) : null;
    fcmToken= json['fcm_token'] != null ? List<String>.from(json["fcm_token"].map((x) => x)) : null;
    email= json['email'] != null ? List<String>.from(json["email"].map((x) => x)) : null;
    phoneNumber= json['phone_number'] != null ? List<String>.from(json["phone_number"].map((x) => x)) : null;
    dateOfBirth=json['date_of_birth'] != null ? List<String>.from(json["date_of_birth"].map((x) => x)) : null;
    bloodType= json['blood_type'] != null ? List<String>.from(json["blood_type"].map((x) => x)) : null;
    governorateId= json['governorate_id'] != null ?  List<String>.from(json["governorate_id"].map((x) => x)) : null;
    cityId=json['city_id'] != null ?  List<String>.from(json["city_id"].map((x) => x)) : null;
  }

}

