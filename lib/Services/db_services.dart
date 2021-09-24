import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whosapp/Models/users.dart';

class DBServices {
  var userCollection = FirebaseFirestore.instance.collection("Users");
  saveUser(CUser user) async {
    try {
      await userCollection.doc(user.uid).set(user.toJson());
    } catch (e) {}
  }
}
