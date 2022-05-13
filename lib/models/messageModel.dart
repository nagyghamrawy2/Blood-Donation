class MessageModel {
  int? senderId;
  String? receiverId;
  String? date;
  String? text;

  MessageModel({
    this.senderId,
    this.receiverId,
    this.date,
    this.text,
});

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
