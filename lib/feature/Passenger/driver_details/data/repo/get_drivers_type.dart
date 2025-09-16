import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasalni1/core/data/models/user_model.dart';

class GetAllDriversInType {
  final FirebaseFirestore firestore;

  GetAllDriversInType(this.firestore);

  Future<List<UserModel>> getAllDriversType(String carType) async {
    try {
      var response = await firestore
          .collection("drivers").where("carType", isEqualTo: carType)
          .get();

      for (var doc in response.docs) {
        print("Driver: ${doc.id} => ${doc.data()}");
      }

      var drivers = response.docs
          .map((e) => UserModel.fromJson(e.data()))
          .toList();

      return drivers;
    } catch (e) {
      print("❌ Error getting drivers by type: $e");
      return [];
    }
  }
}
