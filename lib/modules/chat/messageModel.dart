class MessageModel {
  int? senderId;
  int? reciverId;
  String? date;
  String? text;

  MessageModel({int? senderId, String? reciverId, String? date, String? text}) {
    this.senderId;
    this.reciverId;
    this.date;
    this.text;
  }

  MessageModel.fromJason(Map<String, dynamic> json) {
    senderId = json['senderId'];
    reciverId = json['reciverId'];
    date = json['date'];
    text = json['text'];
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'reciverId': reciverId,
      'date': date,
      'text': text,
    };
  }
}
