import 'package:intl/intl.dart';

class RequestModel {

  bool? status;
  String? message;
  List<Request>? requests;

  RequestModel.fromJson(Map<String, dynamic> json){
    status = json["status"];
    message = json["message"];
    requests = json["requests"] != null ? List<Request>.from(json["requests"].map((x) => Request.fromJson(x))) : null;
  }

}

class Request {

  int? id;
  String? title;
  String? description;
  String? phoneNumber;
  int? noOfBags;
  var requestExpiredDate;
  String? bloodType;
  int? status;
  String? hospitalName;
  String? hospitalAddress;
  Governorate? governorate;
  City? city;
  User? user;

  Request.fromJson(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    description = json["description"];
    phoneNumber = json["phone_number"];
    noOfBags = json["no_of_bags"];
    requestExpiredDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(json["request_expiredDate"]));
    bloodType = json["blood_type"];
    hospitalName = json['hosp_name'];
    hospitalAddress = json['hosp_address'];
    status = json['status'];
    governorate = Governorate.fromJson(json["governorate"]);
    city = City.fromJson(json["city"]);
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }
}

class City {

  int? id;
  String? cityName;

  City.fromJson(Map<String, dynamic> json){
    id = json["id"];
    cityName = json["city_name"];
  }
}

class Governorate {

  int? id;
  String? governorateName;

  Governorate.fromJson(Map<String, dynamic> json){
    id = json["id"];
    governorateName = json["governorate_name"];
  }

}

class User {

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  DateTime? dateOfBirth;
  dynamic profilePicture;
  String? bloodType;
  DateTime ?lastDonateTime;
  int? height;
  String? weight;
  Governorate? governorate;
  City? city;
  dynamic token;

  User.fromJson(Map<String, dynamic> json){
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    dateOfBirth = DateTime.parse(json["date_of_birth"]);
    profilePicture = json["profile_picture"];
    bloodType = json["blood_type"];
    lastDonateTime = DateTime.parse(json["last_donate_time"]);
    height = json["height"];
    weight = json["weight"] != null ? json["weight"] : null;
    governorate = Governorate.fromJson(json["governorate"]);
    city = City.fromJson(json["city"]);
    token = json["token"];
  }

}
