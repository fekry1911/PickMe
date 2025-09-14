import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:wasalni1/core/helpers/cache_helper.dart';
import 'package:wasalni1/feature/register/data/rebo/save_user_data/save_user_data.dart';

import '../../../core/data/models/user_model.dart';
import '../../../core/errors/handle_fire_base_errors/error_fire.dart';
import '../data/rebo/create_email/create_email.dart';

part 'registeration_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  CreateEmail createEmail;
  SaveUserData saveUserData;
  RegisterCubit(this.createEmail,this.saveUserData) : super(RegisterationInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscureText=true;

  String type="passenger";
  void changeType(String value){
    type=value;
    emit(ChangeType(type));
  }
  void register() {
    emit(RegisterationLoading());
    createEmail.createEmail(emailController.text, passwordController.text).then((onValue){
     UserModel userModel=UserModel(
       name: nameController.text,
       email: emailController.text,
       phone: phoneController.text,
       userType: type,
       uid: onValue.uid,
       birthDate: birthDateController.text,
     );
     saveUserData.saveUserData(userModel).then((value) async {
       emit(RegisterationSuccess(userModel));
       await CacheHelper.putString(key: "uid", value: onValue.uid);
       await CacheHelper.putString(key: "type", value: type);
       clear();
     }).catchError((onError){
       final errorMessage = FirebaseErrorHandler.instance.getFirestoreErrorMessage(onError);
       print(FirebaseErrorHandler.instance);
       print("Error in Sign-In: $errorMessage");
       emit(SaveDataError(errorMessage));
     });

   }).catchError((onError){
      final errorMessage = FirebaseErrorHandler.instance.getAuthErrorMessage(onError);
      print(FirebaseErrorHandler.instance);
      print("Error in Sign-In: $errorMessage");
      emit(RegisterationError(errorMessage));
    });
  }
  void changePasswordVisibility(){
    isObscureText=!isObscureText;
    emit(ChangePasswordVisibility(isObscureText));
  }
  clear(){
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    birthDateController.clear();
    passwordController.clear();
  }
}
