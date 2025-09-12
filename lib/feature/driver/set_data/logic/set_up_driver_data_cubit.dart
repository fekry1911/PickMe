import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/handle_fire_base_errors/error_fire.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../data/model/car_data_model.dart';
import '../data/rebo/save_driver_car_data.dart';

part 'set_up_driver_data_state.dart';

class SetUpDriverDataCubit extends Cubit<SetUpDriverDataState> {
  final carModelController = TextEditingController();
  final carPlateController = TextEditingController();
  final licenseController = TextEditingController();
  final driverIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  SaveDriverCarData saveDriverCarData;

  SetUpDriverDataCubit(this.saveDriverCarData)
    : super(SetUpDriverDataInitial());

  void saveDriverExtraData() {
    emit(SetUpDriverDataLoading());
    CarModel carModel;
    try {
      carModel = CarModel(
        carModel: carModelController.text,
        carPlateNumber: carPlateController.text,
        licenseNumber: licenseController.text,
      );
      String uid=CacheHelper.getString(key: "uid");
      saveDriverCarData.saveDriverCarData(carModel, uid);
      emit(SetUpDriverDataSuccess());
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseErrorHandler.instance.getAuthErrorMessage(e);
      emit(SetUpDriverDataError(errorMessage));
    }
  }
}
