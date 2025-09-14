import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/handle_fire_base_errors/error_fire.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../data/model/car_data_model.dart';
import '../data/rebo/image_pick.dart';
import '../data/rebo/save_driver_car_data.dart';

part 'set_up_driver_data_state.dart';

class SetUpDriverDataCubit extends Cubit<SetUpDriverDataState> {
  final carModelController = TextEditingController();
  final carPlateController = TextEditingController();
  final licenseController = TextEditingController();
  final driverIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final SaveDriverCarData saveDriverCarData;
  String licenseUrl = "";
  String carUrl = "";
  String profileUrl = "";

  String? carType;
  SupabaseImageService supabaseImageService;
  int currentStep = 0;

  setCurrentStep(int step) {
    currentStep = step;
    emit(SetCurrent());
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(PreviousStep(step: currentStep));
    }
    print(currentStep);
  }

  void nextStep() {
    if (currentStep == 0) {
      if (formKey.currentState!.validate()) {
        currentStep++;
        emit(NextStep(currentStep));
      }
    } else if (currentStep == 1) {
      if(licenseUrl == "" || carUrl == "" || profileUrl == ""){
        emit(ErrorPickImageFile("لم يتم اختيار صورة"));
      }
      else{
        saveDriverExtraData();
      }
      emit(NextStep(currentStep));
    } else {
      currentStep++;
      emit(NextStep(currentStep));
    }
    print(currentStep);
  }

  SetUpDriverDataCubit(this.saveDriverCarData, this.supabaseImageService)
    : super(SetUpDriverDataInitial());
  final uid = CacheHelper.getString(key: "uid");

  Future<void> saveDriverExtraData() async {
    emit(SetUpDriverDataLoading());

    try {
      final carModel = CarModel(
        carModel: carModelController.text,
        carPlateNumber: carPlateController.text,
        licenseNumber: licenseController.text,
        carType: carType ?? "ملاكي",
        carImage: carUrl,
        licenseImage: licenseUrl,
        profileImage: profileUrl,
      );

      await saveDriverCarData.saveDriverCarData(carModel, uid).then((
        onValue,
      ) async {
        await saveDriverCarData.setAvailability(uid, true);
        await CacheHelper.putBoolean(key: "carDataFinished", value: true);
      });

      emit(SetUpDriverDataSuccess());
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseErrorHandler.instance.getAuthErrorMessage(e);
      emit(SetUpDriverDataError(errorMessage));
    } catch (e) {
      emit(SetUpDriverDataError(e.toString()));
    }
  }

  Future<void> pickLicense() async {
    final licenseFile = await supabaseImageService.pickImage(fromCamera: false);
    emit(LoadingImage());

    try {
      if (licenseFile != null) {
        final licenseUrlSupa = await supabaseImageService.uploadImage(
          licenseFile,
          uid,
          folderName: "license",
        );
        print("🔗 License URL: $licenseUrl");
        licenseUrl = licenseUrlSupa!;
        emit(PickImageFile(licenseUrl!));
      } else {
        emit(ErrorPickImageFile("لم يتم اختيار صورة"));
      }
    } catch (e) {
      emit(ErrorPickImageFile(e.toString()));
    }
  }

  Future<void> pickCarFile() async {
    try {
      final carFile = await supabaseImageService.pickImage(fromCamera: false);
      emit(LoadingImage());

      if (carFile != null) {
        final carUrlSupa = await supabaseImageService.uploadImage(
          carFile,
          uid,
          folderName: "car",
        );
        print("🔗 Car URL: $carUrl");
        carUrl = carUrlSupa!;
        emit(PickImageFile(carUrl!));
      } else {
        emit(ErrorPickImageFile("لم يتم اختيار صورة"));
      }
    } catch (e) {
      emit(ErrorPickImageFile(e.toString()));
    }
  }

  Future<void> pickProfileFile() async {
    try {
      final profileFile = await supabaseImageService.pickImage(
        fromCamera: false,
      );
      emit(LoadingImage());
      if (profileFile != null) {
        final profileUrlSupa = await supabaseImageService.uploadImage(
          profileFile,
          uid,
          folderName: "profile",
        );
        print("🔗 Profile URL: $profileUrl");
        profileUrl = profileUrlSupa!;
        emit(PickImageFile(profileUrl!));
      } else {
        emit(ErrorPickImageFile("لم يتم اختيار صورة"));
      }
    } catch (e) {
      emit(ErrorPickImageFile(e.toString()));
    }
  }
}
