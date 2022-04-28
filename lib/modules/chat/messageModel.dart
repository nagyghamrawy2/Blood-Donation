import 'package:flutter/material.dart';
class MessageModel {

   int? senderId;
   int? reciverId;
   String? date;
   String? text;



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
