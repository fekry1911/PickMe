import 'package:firebase_auth/firebase_auth.dart';
import 'package:wasalni1/feature/login/data/rebo/sign-email-password.dart';

class SignInWithEmailAndPasswordImpl extends SignInWithEmailAndPassword {
  FirebaseAuth _auth;

  SignInWithEmailAndPasswordImpl(this._auth);

  @override
  Future<User?> signInWithEmail(email, password) async {
    final UserCredential userCredential = await _auth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
}
