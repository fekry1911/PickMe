import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/driver_model.dart';

class GetDiverDataRebo {
  FirebaseFirestore firestore;

  GetDiverDataRebo(this.firestore);

  Future<DriverModel> getDiverData(String uid) async {
    print(uid + " !@#!@#" + "reboooo");
    DriverModel? driver;
    await firestore
        .collection('drivers')
        .doc(uid)
        .get()
        .then((onValue) {
          driver = DriverModel.fromJson(onValue.data()!);
          print("succ");
    })
        .catchError((onError) {
          print("Error");

    });
    return driver!;
  }
}
