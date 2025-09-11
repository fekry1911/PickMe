import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/errors/handle_fire_base_errors/error_fire.dart';
import '../data/rebo/auth_rebo.dart';
import '../data/rebo/sign-email-password.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthGoogleService _authService;
  final SignInWithEmailAndPassword _signInWithEmailAndPassword;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginCubit(this._authService, this._signInWithEmailAndPassword)
    : super(LoginInitial());

  Future<void> signInWithGoogle() async {
    try {
      final user = await _authService.signInWithGoogle();
      if (user != null) {
        emitState(LoginSuccess(user));
      } else {
        emitState(LoginFailure("Google Sign-In failed"));
      }
    } on FirebaseAuthException catch (e) {
      print(FirebaseErrorHandler.instance.getAuthErrorMessage(e));
      final errorMessage = FirebaseErrorHandler.instance.getAuthErrorMessage(e);
      print("Error in Google Sign-In: $errorMessage");
      emitState(LoginFailure(errorMessage));
    }
  }

  Future<void> signInWithEmail() async {
    try {
      final user = await _signInWithEmailAndPassword.signInWithEmail(
        emailController.text,
        passwordController.text,
      );
      emitState(LoginSuccess(user!));
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseErrorHandler.instance.getAuthErrorMessage(e);
      print(FirebaseErrorHandler.instance);
      print("Error in Sign-In: $errorMessage");
      emitState(LoginFailure(errorMessage));
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  void emitState(LoginState state) {
    emit(state);
  }
}
