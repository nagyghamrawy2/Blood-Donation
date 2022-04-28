
class GovernorateModel {
  GovernorateModel({
    required this.status,
    required this.message,
    required this.governorates,
  });

  bool status;
  String message;
  List<Governorate> governorates;

  factory GovernorateModel.fromJson(Map<String, dynamic> json) => GovernorateModel(
    status: json["status"],
    message: json["message"],
    governorates: List<Governorate>.from(json["governorates"].map((x) => Governorate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "governorates": List<dynamic>.from(governorates.map((x) => x.toJson())),
  };
}

class Governorate {
  Governorate({
    required this.id,
    required this.governorateName,
  });

  int id;
  String governorateName;

  factory Governorate.fromJson(Map<String, dynamic> json) => Governorate(
    id: json["id"],
    governorateName: json["governorate_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "governorate_name": governorateName,
  };
}


