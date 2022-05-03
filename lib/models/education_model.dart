
class EducationModel {

  bool? status;
  String? message;
  List<EducationData>? posts;

  EducationModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    posts =  json["posts"] != null ? List<EducationData>.from(json["posts"].map((x) => EducationData.fromJson(x))) : null;
  }

}

class EducationData {


  int? id;
  String? title;
  String? description;
  String? image;

  EducationData.fromJson(Map<String, dynamic> json) {
    id =  json["id"];
    title = json["title"];
    description = json["description"];
    image = json["image"];
  }

}
