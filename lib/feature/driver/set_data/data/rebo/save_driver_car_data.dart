import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../model/car_data_model.dart';

class SaveDriverCarData{
  FirebaseFirestore firestore;
  final DatabaseReference _db;

  SaveDriverCarData(this.firestore, this._db);

  Future<void> saveDriverCarData(CarModel carModel,String uid) async {
    uid=CacheHelper.getString(key: "uid");
    await firestore
        .collection('drivers')
        .doc(uid)
        .set(carModel.toJson(), SetOptions(merge: true));
  }
  Future<void> setAvailability(String uid, bool isAvailable) async {
    await _db.child('drivers/$uid').update({
      'availability': isAvailable,
    });
  }

}