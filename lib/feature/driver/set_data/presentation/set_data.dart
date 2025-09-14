import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wasalni1/core/const/const.dart';
import 'package:wasalni1/core/helpers/context_extention.dart';
import 'package:wasalni1/core/theme/colors.dart';
import 'package:wasalni1/feature/driver/set_data/presentation/widgets/car_data.dart';
import 'package:wasalni1/feature/driver/set_data/presentation/widgets/car_fiels.dart';

import '../../../../core/shred_widgets/loading.dart';
import '../../../../core/shred_widgets/toasts/error.dart';
import '../../../../core/shred_widgets/toasts/suc.dart';
import '../logic/set_up_driver_data_cubit.dart';

class SetDataDriver extends StatelessWidget {
  const SetDataDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.mainColor.withOpacity(0.1), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // ===== Circles Decoration =====
            Positioned(
              top: -60.h,
              left: -50.w,
              child: CircleAvatar(
                radius: 100.r,
                backgroundColor: AppColors.mainColor.withOpacity(0.15),
              ).animate().scale(duration: 1.seconds),
            ),
            Positioned(
              bottom: -80.h,
              right: -60.w,
              child: CircleAvatar(
                radius: 120.r,
                backgroundColor: AppColors.mainColor.withOpacity(0.15),
              ).animate().fadeIn(duration: 1.2.seconds),
            ),

            // ===== Lottie Animation (Car) =====
            Positioned(
              top: 100.h,
              left: 0,
              right: 0,
              child: Lottie.asset(
                "assets/animations/setDriver.json",
                delegates: LottieDelegates(
                  values: [
                    ValueDelegate.colorFilter(
                      const ['**'],
                      value: ColorFilter.mode(
                        AppColors.mainColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                height: 100.h,
                repeat: true,
              ),
            ),

            // ===== Form Section =====
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20..r,
                  horizontal: 10.r,
                ),
                height: MediaQuery.of(context).size.height * 0.6,
                // 👈 60% من الشاشة
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: BlocConsumer<SetUpDriverDataCubit, SetUpDriverDataState>(
                  listener: (context, state) {
                    if (state is SetUpDriverDataError) {
                      showErrorToast(context, state.error);
                    }
                    if (state is SetUpDriverDataLoading) {
                      dialogLoading(context);
                    }
                    if (state is SetUpDriverDataSuccess) {
                      context.pushAndRemoveUntil(driverHome);
                    }
                    if(state is ErrorPickImageFile){
                      Navigator.pop(context);
                      showErrorToast(context, state.error);
                    }
                    if(state is LoadingImage){
                      dialogLoading(context);
                    }
                    if(state is PickImageFile){
                      Navigator.pop(context);
                      showSuccToast(context, "تم تحميل الصورة بنجاح");
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<SetUpDriverDataCubit>();

                    return Stepper(
                      type: StepperType.horizontal,
                      currentStep: cubit.currentStep,
                      physics: ClampingScrollPhysics(),
                      onStepTapped: (int step) {
                        cubit.setCurrentStep(step);
                      },
                      onStepCancel: cubit.previousStep,
                      onStepContinue: cubit.nextStep,

                      controlsBuilder:
                          (BuildContext context, ControlsDetails details) {
                            return Padding(
                              padding: EdgeInsets.only(top: 20.0.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: details.onStepCancel,
                                    child: Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: details.onStepContinue,
                                    child: cubit.currentStep != 2
                                        ? Text('Continue')
                                        : Text("submit"),
                                  ),
                                ],
                              ),
                            );
                          },
                      steps: [
                        Step(
                          title: Text(
                            'Step 1',
                            style: GoogleFonts.alice(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainColor,
                            ),
                          ),
                          content: CarData(cubit: cubit),
                          isActive: cubit.currentStep >= 0,
                        ),
                        Step(
                          title: Text(
                            'Step 2',
                            style: GoogleFonts.alice(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainColor,
                            ),
                          ),
                          content: CarFiles(cubit: cubit),
                          isActive: cubit.currentStep >= 1,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
* */
