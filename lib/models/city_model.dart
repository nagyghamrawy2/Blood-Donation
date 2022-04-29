class CityModel {

  bool? status;
  String? message;
  List<Cities>? cities;

  CityModel.fromJson(Map<String, dynamic> json){
    status= json["status"];
    message= json["message"];
    cities= List<Cities>.from(json["cities"].map((x) => Cities.fromJson(x)));
  }

}

class Cities {

  int? id;
  String? cityName;

  Cities.fromJson(Map<String, dynamic> json){
    id= json["id"];
    cityName= json["city_name"];
  }

}
