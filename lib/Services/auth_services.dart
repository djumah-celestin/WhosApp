import 'package:firebase_auth/firebase_auth.dart';
import 'package:whosapp/Models/users.dart';
import 'package:whosapp/Services/db_services.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  Future<bool> signIn(String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
      print(user);
      return true;
    } on FirebaseException catch (e) {
      print(e);
      return false;
    }
  }

  signUp(String name, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await DBServices().saveUser(CUser(
        uid: user.uid,
        email: user.email,
        name: name,
      ));
      print(user);
      return true;
    } on FirebaseException catch (e) {
      print(e);
      return false;
    }
  }

  User get user => FirebaseAuth.instance.currentUser;

  Stream<User> get onChangedUser => _auth.authStateChanges();

  signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {}
  }
}
