import 'package:cloud_firestore/cloud_firestore.dart';

class DBServices {
  var userCollection = FirebaseFirestore.instance.collection("Users");
  saveUser(){}
}
