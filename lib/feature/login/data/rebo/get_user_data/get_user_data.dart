import 'package:wasalni1/core/data/models/user_model.dart';

abstract class GetUserData{
  Future<UserModel?> getUserData(String uid);
}