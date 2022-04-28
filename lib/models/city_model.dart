

class CityModel {
  CityModel({
    required this.status,
    required this.message,
    required this.cities,
  });

  bool status;
  String message;
  List<City> cities;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    status: json["status"],
    message: json["message"],
    cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
  };
}

class City {
  City({
    required this.id,
    required this.cityName,
  });

  int id;
  String cityName;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    cityName: json["city_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_name": cityName,
  };
}
