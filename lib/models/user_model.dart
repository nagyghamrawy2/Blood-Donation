// // class userModel {
// //   late bool status;
// //   String? message;
// //   UserDataModel? user;
// //
// //   userModel.fromJson(Map<String?, dynamic>json){
// //     status = json['status'];
// //     message = json['message'];
// //     user = UserDataModel.fromJson(json['user']);
// //   }
// // }
// //
// // class UserDataModel{
// //   List<data> userData = [];
// //   UserDataModel.fromJson(Map<String,dynamic> json){
// //     json['user'].forEach((element){
// //       userData.add(data.fromJson(element));
// //     });
// //   }
// // }
// // class data {
// //   String? name;
// //   String? email;
// //   String? phone;
// //   String? date_of_birth;
// //   String? profile_picture;
// //   String? blood_type;
// //   var height;
// //   var weight;
// //
// //   data.fromJson(Map<String, dynamic>json){
// //     name = json['name'];
// //     email = json['email'];
// //     phone = json['phone_number'];
// //     date_of_birth = json['date_of_birth'];
// //     profile_picture = json['profile_picture'];
// //     blood_type = json['blood_type'];
// //     height = json['height'];
// //     weight = json['weight'];
// //   }
// // }
//
// class Response {
//   Response({
//     this.status,
//     this.errorNum,
//     this.message,
//     this.user,
//   });
//   bool? status;
//   String? errorNum;
//   var message;
//   List<User>? user;
//
//   factory Response.fromJson(Map<String, dynamic> json) => Response(
//     status: json["status"],
//     errorNum: json["errorNum"],
//     message: json["message"],
//     user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
//   );
// }
//
// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? phoneNumber;
//   DateTime? dateOfBirth;
//   dynamic profilePicture;
//   String? bloodType;
//   dynamic height;
//   dynamic weight;
//
//   User.fromJson(Map<String, dynamic> json){
//     id =  json["id"];
//     name =  json["name"];
//     email =  json["email"];
//     phoneNumber =  json["phone_number"];
//     dateOfBirth =  DateTime.parse(json["date_of_birth"]);
//     profilePicture =  json["profile_picture"];
//     bloodType =  json["blood_type"];
//     height =  json["height"];
//     weight =  json["weight"];
//   }
// }
//
//
// // To parse this JSON data, do
// //
// //     final response1 = response1FromJson(jsonString);
//
//
// class Response1 {
//   Response1({
//     this.status,
//     this.errorNum,
//     this.message,
//   });
//
//   bool? status;
//   String? errorNum;
//   Message? message;
//
//   factory Response1.fromJson(Map<String, dynamic> json) => Response1(
//     status: json["status"],
//     errorNum: json["errorNum"],
//     message: Message.fromJson(json["message"]),
//   );
// }
//
// class Message {
//   Message({
//     this.email,
//   });
//
//   List<String>? email;
//
//   factory Message.fromJson(Map<String, dynamic> json) => Message(
//     email: List<String>.from(json["email"].map((x) => x)),
//   );
//
// }
