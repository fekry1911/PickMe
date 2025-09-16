import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

import '../../../../core/data/models/user_model.dart';
import '../data/repo/get_drivers_type.dart';

part 'type_drivers_state.dart';

class TypeDriversCubit extends Cubit<TypeDriversState> {
  final DatabaseReference _db;
  GetAllDriversInType getAllDriversInType;

  TypeDriversCubit(this._db,this.getAllDriversInType) : super(TypeDriversInitial());

  Stream<bool> getAvailabilityStream(String uid) {
    final ref = _db.child('drivers/$uid/availability');
    return ref.onValue.map((event) {
      final value = event.snapshot.value;
      return value == true; // لو مش موجود يبقى false
    });
  }

  List<UserModel> drivers = [];

  Future<void> getAllDriversType(String carType) async {
    emit(TypeDriversLoading()); // ✅ خطوة حلوة عشان تبين إن فيه لودينج

    try {
      var response = await getAllDriversInType.getAllDriversType(carType);

      print("🔥 Response from repo: $response"); // ده هيطبع List من UserModel
      drivers = response;
      print("🚗 Drivers count: ${drivers.length}");

      if (drivers.isEmpty) {
        emit(TypeDriversEmpty()); // لو مفيش داتا
      } else {
        emit(GetAllDriversType(drivers: drivers)); // لو فيه داتا
      }
    } catch (e) {
      print("❌ Error in Cubit: $e");
      emit(TypeDriversError(error: e.toString()));
    }
  }

}
