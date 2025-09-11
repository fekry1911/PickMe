import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasalni1/feature/register/data/rebo/save_user_data/save_user_data.dart';

import '../../../../../core/data/models/user_model.dart';

class SaveUserDataImpl extends SaveUserData {
  final FirebaseFirestore _firestore;

  SaveUserDataImpl(this._firestore);

  @override
  Future<void> saveUserData(UserModel userModel) async {
    if (userModel.userType == "Passenger") {
     await _firestore
          .collection("Passenger")
          .doc(userModel.uid)
          .set(userModel.toJson());
    } else {
    await  _firestore
          .collection("drivers")
          .doc(userModel.uid)
          .set(userModel.toJson());
    }
  }
}
