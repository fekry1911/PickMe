import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wasalni1/core/const/const.dart';
import 'package:wasalni1/core/helpers/context_extention.dart';
import 'package:wasalni1/core/shred_widgets/shared_text_form_field.dart';
import 'package:wasalni1/core/theme/colors.dart';
import '../../../../core/shred_widgets/loading.dart';
import '../../../../core/shred_widgets/toasts/error.dart';
import '../logic/set_up_driver_data_cubit.dart';

class SetDataDriver extends StatelessWidget {
  SetDataDriver({super.key});


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetUpDriverDataCubit>();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.mainColor.withOpacity(0.1),
              Colors.white,
            ],
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
              top: 150.h,
              left: 0,
              right: 0,
              child: Lottie.asset(
                "assets/animations/setDriver.json",
                delegates: LottieDelegates(
                  values: [
                    ValueDelegate.colorFilter(
                      const ['**'],
                      value:  ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn),
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
                padding: EdgeInsets.all(20.w),
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
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),

                        AutoSizeText(
                          "Complete your driver setup 🚗",
                          maxLines: 1,
                          minFontSize: 16,
                          maxFontSize: 24,
                          style: GoogleFonts.alice(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainColor,
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 800.ms)
                            .slideY(begin: -0.3, end: 0),

                        SizedBox(height: 20.h),

                        // Car Model
                        SharedTextFormField(
                          hintText: "Car Model",
                          validator: (value) =>
                          value!.isEmpty ? "Enter your car model" : null,
                          controller: cubit.carModelController,
                        ),
                        SizedBox(height: 16.h),

                        // Car Plate Number
                        SharedTextFormField(
                          hintText: "Car Plate Number",
                          validator: (value) => value!.isEmpty
                              ? "Enter your car plate number"
                              : null,
                          controller: cubit.carPlateController,
                        ),
                        SizedBox(height: 16.h),

                        // License Number
                        SharedTextFormField(
                          hintText: "License Number",
                          validator: (value) =>
                          value!.isEmpty ? "Enter your license number" : null,
                          controller: cubit.licenseController,
                        ),
                        SizedBox(height: 24.h),

                        // Save Button
                     SizedBox(
                              width: double.infinity,
                              height: 50.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.saveDriverExtraData();
                                  }
                                },
                                child: Text(
                                  "Complete Setup",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                                  .animate()
                                  .fadeIn(duration: 600.ms)
                                  .scale(duration: 600.ms),
                            ),
                        BlocListener<SetUpDriverDataCubit, SetUpDriverDataState>(listener: (context,state){
                          if(state is SetUpDriverDataSuccess){
                            context.pushAndRemoveUntil(driverHome);
                          }
                          if(state is SetUpDriverDataError){
                            Navigator.pop(context);
                            showErrorToast(context, state.error);
                          }
                          if (state is SetUpDriverDataLoading) {
                            dialogLoading(context);
                          }

                        },
                          child: SizedBox.shrink(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
