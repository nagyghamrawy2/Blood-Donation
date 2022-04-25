class Register {
  bool? status;
  String? message;
  Errors? errors;
  User? user;

  Register.fromJson(Map<String, dynamic> json){
    status= json["status"];
    message= json["message"];
    errors= json['errors'] != null ? Errors.fromJson(json["errors"]) : null;
    user= json['user'] != null ? User.fromJson(json['user']) : null;
  }

}

class User {

  String? name;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  String? bloodType;
  String? governorateId;
  String? cityId;
  String? lastDonateTime;
  int? availableForDonate;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? token;

  User.fromJson(Map<String, dynamic> json){
    name= json["name"];
    email= json["email"];
    phoneNumber= json["phone_number"];
    dateOfBirth= json["date_of_birth"];
    bloodType= json["blood_type"];
    governorateId= json["governorate_id"];
    cityId= json["city_id"];
    lastDonateTime= json["last_donate_time"];
    availableForDonate= json["available_for_donate"];
    updatedAt= DateTime.parse(json["updated_at"]);
    createdAt= DateTime.parse(json["created_at"]);
    id= json["id"];
    token= json["token"];
  }

}

class Errors {
  List<String>? name;
  List<String>? email;
  List<String>? phoneNumber;
  // List<String> password=[];
  // List<String> dateOfBirth=[];
  // List<String> bloodType=[];
  // List<String> governorateId=[];
  // List<String> cityId=[];

  Errors.fromJson(Map<String, dynamic> json){
    name= json['name'] != null ? List<String>.from(json["name"].map((x) => x)) : null;
    email= json['email'] != null ? List<String>.from(json["email"].map((x) => x)) : null;
    phoneNumber= json['phone_number'] != null ? List<String>.from(json["phone_number"].map((x) => x)) : null;
    // password= List<String>.from(json["password"].map((x) => x));
    // dateOfBirth= List<String>.from(json["date_of_birth"].map((x) => x));
    // bloodType= List<String>.from(json["blood_type"].map((x) => x));
    // governorateId= List<String>.from(json["governorate_id"].map((x) => x));
    // cityId= List<String>.from(json["city_id"].map((x) => x));
  }

}
