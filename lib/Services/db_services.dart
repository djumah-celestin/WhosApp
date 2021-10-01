import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whosapp/Models/users.dart';
import 'package:whosapp/Models/message.dart';
import 'package:whosapp/Services/auth_services.dart';

class DBServices {
  var userCollection = FirebaseFirestore.instance.collection("Users");
  var msgCollection = FirebaseFirestore.instance.collection("Messages");
  saveUser(CUser user) async {
    try {
      await userCollection.doc(user.uid).set(user.toJson());
    } catch (e) {}
  }

  Stream<List<CUser>> get getDiscussionUsers {
    return userCollection
        .where("uid", isNotEqualTo: AuthServices().user.uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => CUser.fromJson(e.data())).toList());
  }

  Stream<List<Message>> getMessage(String receiverUID,
      [bool myMessage = true]) {
    return msgCollection
        .where('senderUID',
            isEqualTo: myMessage ? AuthServices().user.uid : receiverUID)
        .where('receiverUID',
            isEqualTo: myMessage ? receiverUID : AuthServices().user.uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Message.fromJson(e.data(), e.id)).toList());
  }

  Future<bool> sendMessage(Message msg) async {
    try {
      await msgCollection.doc().set(msg.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
