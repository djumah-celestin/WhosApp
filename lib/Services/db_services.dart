import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whosapp/Models/users.dart';
import 'package:whosapp/Services/auth_services.dart';

class DBServices {
  var userCollection = FirebaseFirestore.instance.collection("Users");
  saveUser(CUser user) async {
    try {
      await userCollection.doc(user.uid).set(user.toJson());
    } catch (e) {}
  }
  Stream<List<CUser>> get getDiscussionUsers {
    return userCollection.where("uid", isNotEqualTo: AuthServices().user.uid).snapshots().map((event) => event.docs.map((e) => CUser.fromJson(e.data())).toList());
  }
}
