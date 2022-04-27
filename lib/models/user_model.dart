class UserModel {
  late bool status;
  String? message;
  Errors? errors;
  UserData? user;

  UserModel.fromJson(Map<String, dynamic> json){
    status= json["status"];
    message= json["message"];
    errors= json['errors'] != null ? Errors.fromJson(json["errors"]) : null;
    user= json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

}

class UserData {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? phoneNumber;
  DateTime? dateOfBirth;
  dynamic profilePicture;
  String? bloodType;
  DateTime? lastDonateTime;
  dynamic height;
  dynamic weight;
  bool? availableForDonate;
  int? governorateId;
  int? cityId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? token;

  UserData.fromJson(Map<String, dynamic> json){
    id= json["id"];
    name= json["name"];
    email= json["email"];
    emailVerifiedAt= json["email_verified_at"];
    phoneNumber= json["phone_number"];
    dateOfBirth= DateTime.parse(json["date_of_birth"]);
    profilePicture= json["profile_picture"];
    bloodType= json["blood_type"];
    lastDonateTime= DateTime.parse(json["last_donate_time"]);
    height= json["height"];
    weight= json["weight"];
    availableForDonate= json["available_for_donate"];
    governorateId= json["governorate_id"];
    cityId= json["city_id"];
    createdAt= DateTime.parse(json["created_at"]);
    updatedAt= DateTime.parse(json["updated_at"]);
    token= json["token"];
  }

}

class Errors {
  List<String>? name;
  List<String>? email;
  List<String>? phoneNumber;
  List<String>? password;
  List<String>? dateOfBirth;
  List<String>? bloodType;
  List<String>? governorateId;
  List<String>? cityId;

  Errors.fromJson(Map<String, dynamic> json){
    name= json['name'] != null ? List<String>.from(json["name"].map((x) => x)) : null;
    email= json['email'] != null ? List<String>.from(json["email"].map((x) => x)) : null;
    phoneNumber= json['phone_number'] != null ? List<String>.from(json["phone_number"].map((x) => x)) : null;
    password=json['password'] != null ? List<String>.from(json["password"].map((x) => x)) : null;
    dateOfBirth=json['date_of_birth'] != null ? List<String>.from(json["date_of_birth"].map((x) => x)) : null;
    bloodType= json['blood_type'] != null ? List<String>.from(json["blood_type"].map((x) => x)) : null;
    governorateId= json['governorate_id'] != null ?  List<String>.from(json["governorate_id"].map((x) => x)) : null;
    cityId=json['city_id'] != null ?  List<String>.from(json["city_id"].map((x) => x)) : null;
  }

}
