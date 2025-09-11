import 'package:firebase_auth/firebase_auth.dart';

abstract class CreateEmail{
  Future<User> createEmail(String email, String password);
}