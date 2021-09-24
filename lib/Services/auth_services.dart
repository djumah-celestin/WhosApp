import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  signIn(String email, String password) {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  signUp(String name, String email, String password) {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

}
