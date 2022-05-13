class MessageModel {
  int? senderId;
  int? receiverId;
  String? date;
  String? text;

  MessageModel({int? senderId, int? receiverId, String? date, String? text}) {
    this.senderId;
    this.receiverId;
    this.date;
    this.text;
  }

  MessageModel.fromJason(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    date = json['date'];
    text = json['text'];
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'date': date,
      'text': text,
    };
  }
}
