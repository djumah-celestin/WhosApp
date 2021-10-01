import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whosapp/Services/auth_services.dart';

class Message {
  String uid;
  String content;
  String senderUID;
  String receiverUID;
  Timestamp createdAt;
  Message(
      {this.uid,
      this.content,
      this.createdAt,
      this.receiverUID,
      this.senderUID});
  Message.fromJson(Map<String, dynamic> json, String id) {
    uid = id;
    content = json['content'];
    senderUID = json['senderUID'];
    receiverUID = json['receiverUID'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'senderUID': senderUID,
      'receiverUID': receiverUID,
      'createdAt': createdAt,
    };

    
  }
  bool get isMe => AuthServices().user.uid == senderUID;
}
