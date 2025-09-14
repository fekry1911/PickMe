import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../login/logic/login_cubit.dart';
import '../presentation/screens/driver_main.dart';
import '../presentation/screens/driver_setting.dart';

part 'driver_home_state.dart';

class DriverHomeCubit extends Cubit<DriverHomeState> {
  final DatabaseReference _db;

  DriverHomeCubit(this._db) : super(DriverHomeInitial());
  int index = 0;
  List<Widget> screens = [DriverMainHome(), BlocProvider(
    create: (context) => sl<LoginCubit>(),
    child: DriverSetting(),
  )
  ];

  changeIndex(index) {
    this.index = index;
    emit(ChangeIndex(index: index));
  }

  Stream<bool> getAvailabilityStream(String uid) {
    final ref = _db.child('drivers/$uid/availability');
    return ref.onValue.map((event) {
      final value = event.snapshot.value;
      return value == true; // لو مش موجود يبقى false
    });
  }
  Future<void> setAvailability(String uid, bool isAvailable) async {
    await _db.child('drivers/$uid').update({
      'availability': isAvailable,
    });
  }

}
