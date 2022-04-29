
class GovernorateModel {
  bool? status;
  String? message;
  List<Governorates>? governorates;

  GovernorateModel.fromJson(Map<String, dynamic> json){
    status= json["status"];
    message= json["message"];
    governorates= List<Governorates>.from(json["governorates"].map((x) => Governorates.fromJson(x)));
  }

}

class Governorates {
  int? id;
  String? governorateName;

  Governorates.fromJson(Map<String, dynamic> json){
    id= json["id"];
    governorateName= json["governorate_name"];
  }

}


