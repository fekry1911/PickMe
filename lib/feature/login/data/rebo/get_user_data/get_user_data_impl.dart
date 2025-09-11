import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasalni1/core/data/models/user_model.dart';

import 'get_user_data.dart';

class GetUserDataImpl extends GetUserData{
  FirebaseFirestore firestore;
  GetUserDataImpl(this.firestore);
  @override
  Future<UserModel?> getUserData(String uid) async {
    UserModel userModel;
    final passengerSnap = await firestore
        .collection("Passenger")
        .doc(uid)
        .get();

    if (passengerSnap.exists) {
      userModel = UserModel.fromJson(passengerSnap.data()!);
      return userModel;
    }

    // لو مش موجود في passengers دور في drivers
    final driverSnap = await firestore
        .collection("drivers")
        .doc(uid)
        .get();

    if (driverSnap.exists) {
      userModel = UserModel.fromJson(driverSnap.data()!);

      return userModel;
    }

    // مش موجود خالص
    return null;

  }
}