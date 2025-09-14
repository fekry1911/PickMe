import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:wasalni1/core/data/models/user_model.dart';

import '../../../core/errors/handle_fire_base_errors/error_fire.dart';
import '../../../core/helpers/cache_helper.dart';
import '../data/rebo/auth_rebo.dart';
import '../data/rebo/get_user_data/get_user_data.dart';
import '../data/rebo/sign-email-password.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthGoogleService _authService;
  final GetUserData _getUserData;
  final SignInWithEmailAndPassword _signInWithEmailAndPassword;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginCubit(this._authService, this._signInWithEmailAndPassword, this._getUserData)
    : super(LoginInitial());

  Future<void> signInWithGoogle() async {
    emitState(LoginLoading());
    try {
      final user = await _authService.signInWithGoogle();
      if (user != null) {
        emitState(LoginSuccess(user));
        getUserData(user.uid);
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
    emitState(LoginLoading());
    try {
      final user = await _signInWithEmailAndPassword.signInWithEmail(
        emailController.text,
        passwordController.text,
      );
      emitState(LoginSuccess(user!));
      getUserData(user.uid);
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseErrorHandler.instance.getAuthErrorMessage(e);
      print(FirebaseErrorHandler.instance);
      print("Error in Sign-In: $errorMessage");
      emitState(LoginFailure(errorMessage));
    }
  }

  Future<void> getUserData(String uid) async {
    try {
      final userModel = await _getUserData.getUserData(uid);
      if (userModel != null) {
        await CacheHelper.putString(key: "uid", value: userModel.uid);
        await CacheHelper.putString(key: "type", value: userModel.userType);
        await CacheHelper.putBoolean(key: "carDataFinished", value: true);
        emitState(GetDataSuccess(userModel));
      } else {
        emitState(GetUserDataFailure("User data not found"));
    }
      } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseErrorHandler.instance.getAuthErrorMessage(e);

      emitState(GetUserDataFailure("Error fetching user data: $errorMessage"));
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    CacheHelper.removeString(key: "uid");
    CacheHelper.removeString(key: "type");
    CacheHelper.removeBool(key: "carDataFinished");
    emitState(SignOutSuccess());
  }

  void emitState(LoginState state) {
    emit(state);
  }
}
