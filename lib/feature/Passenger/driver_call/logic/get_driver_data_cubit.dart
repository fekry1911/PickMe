import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wasalni1/feature/Passenger/driver_call/presentation/driver_data.dart';

import '../data/models/driver_model.dart';
import '../data/rebo/get_driver_data_rebo.dart';

part 'get_driver_data_state.dart';

class GetDriverDataCubit extends Cubit<GetDriverDataState> {
  GetDiverDataRebo getDiverDataRebo;
  GetDriverDataCubit(this.getDiverDataRebo) : super(GetDriverDataInitial());
  DriverModel? driverModel;
  Future<void> getDriverData(String uid)async{
    emit(GetDriverDataLoading());
    try{
      driverModel=await getDiverDataRebo.getDiverData(uid);
      emit(GetDriverDataSucc(driverModel!));
    }
        catch(e){
      emit(GetDriverDataError(e.toString()));
    }

  }
}
