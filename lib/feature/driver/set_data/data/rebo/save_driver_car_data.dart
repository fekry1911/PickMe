import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../model/car_data_model.dart';

class SaveDriverCarData{
  FirebaseFirestore firestore;
  SaveDriverCarData(this.firestore);

  Future<void> saveDriverCarData(CarModel carModel,String uid) async {
    uid=CacheHelper.getString(key: "uid");
    await firestore
        .collection('drivers')
        .doc(uid)
        .set(carModel.toJson(), SetOptions(merge: true));
  }

}