import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository() : _auth = FirebaseAuth.instance;

  Future<void> signUp(
    String email,
    String password,
  ) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithCredentials(
    String email,
    String password,
  ) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  User? getUser() {
    return _auth.currentUser;
  }

  Future<void> updateUsername(String name) async {
    await _auth.currentUser?.updateDisplayName(name);
  }
}
