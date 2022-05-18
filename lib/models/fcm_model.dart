class FcmTokenModel {

  bool? status;
  String? message;
  Errors? errors;

  FcmTokenModel.fromJson(Map<String, dynamic> json) {
     status = json["status"];
     message =  json["message"];
     errors =  Errors.fromJson(json["errors"]);

   }


}

class Errors {

  List<String>? fcmToken;

   Errors.fromJson(Map<String, dynamic> json) {
    fcmToken = List<String>.from(json["fcm_token"].map((x) => x));

  }


}
