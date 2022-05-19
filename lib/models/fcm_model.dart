class FcmTokenModel {

  bool? status;
  String? message;
  User? user;

  FcmTokenModel.fromJson(Map<String, dynamic> json) {
     status = json["status"];
     message =  json["message"];
     user =  User.fromJson(json["user"]);

   }


}

class User {

  List<String>? fcmToken;

  User.fromJson(Map<String, dynamic> json) {
    fcmToken = List<String>.from(json["fcm_token"].map((x) => x));

  }


}
