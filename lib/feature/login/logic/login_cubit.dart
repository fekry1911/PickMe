import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../data/rebo/auth_rebo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;

  LoginCubit(this._authService) : super(LoginInitial());
  Future<void> signInWithGoogle() async {
    try {
      final user = await _authService.signInWithGoogle();
      if (user != null) {
        emitState(LoginSuccess(user));
      } else {
        emitState(LoginFailure("Google Sign-In failed"));
      }
    }
    catch (e) {
      print("Error in Google Sign-In: $e");
    }
  }
  Future<void> signOut() async {
    await _authService.signOut();
  }
  void emitState(LoginState state) {
    emit(state);
  }
}
