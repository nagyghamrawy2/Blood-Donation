import 'package:flutter/material.dart';
class MessageModel {


  late String senderId;
  late String reciverId;
  late String date;
  late String text;

  MessageModel({
    required this.senderId,
    required this.reciverId,
    required this.date,
    required this.text,
  });

  MessageModel.fromJason(Map<String, dynamic>json)
  {
    senderId = json['senderId'];
    reciverId = json['reciverId'];
    date = json['date'];
    text = json['text'];
  }

  Map<String, dynamic> toMap() {
    return
      {
        'senderId': senderId,
        'reciverId': reciverId,
        'date': date,
        'text': text,
      };
  }
}
