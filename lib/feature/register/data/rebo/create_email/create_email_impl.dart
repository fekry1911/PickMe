import 'package:firebase_auth/firebase_auth.dart';
import 'package:wasalni1/feature/register/data/rebo/create_email/create_email.dart';

class CreateEmailImpl extends CreateEmail {
  final FirebaseAuth _auth;

  CreateEmailImpl(this._auth);

  @override
  Future<User> createEmail(String email, String password) {
    return _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user!);
  }
}
