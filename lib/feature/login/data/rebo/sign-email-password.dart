import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInWithEmailAndPassword{
  Future<User?> signInWithEmail(email,password);
}