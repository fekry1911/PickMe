import 'package:wasalni1/core/data/models/user_model.dart';

abstract class SaveUserData{
  Future<void> saveUserData(UserModel userModel);
}