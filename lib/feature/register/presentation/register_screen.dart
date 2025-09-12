import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wasalni1/core/helpers/context_extention.dart';
import 'package:wasalni1/core/shred_widgets/toasts/error.dart';

import '../../../core/const/const.dart';
import '../../../core/helpers/cache_helper.dart';
import '../../../core/shred_widgets/loading.dart';
import '../../../core/shred_widgets/shared_text_form_field.dart';
import '../../../core/shred_widgets/toasts/suc.dart';
import '../../../core/theme/colors.dart';
import '../logic/registeration_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pushAndRemoveUntil(loginScreen);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(200.r),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(color: AppColors.whiteColor),
                ),
              ],
            ),

            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Center(
                child: Form(
                  key: context.read<RegisterCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back Arrow
                      Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Title
                              Text(
                                "Sign up",
                                style: GoogleFonts.aboreto(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.whiteColor,
                                ),
                              ),

                              SizedBox(height: 5.h),

                              Text(
                                "Create an account to continue!",
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.whiteColor,
                                ),
                              ),

                              SizedBox(height: 15.h),

                              // Full Name
                              SharedTextFormField(
                                controller: context
                                    .read<RegisterCubit>()
                                    .nameController,
                                hintText: 'Full name',
                                validator: (String) {
                                  if (String!.isEmpty) {
                                    return "Please enter your full name";
                                  }
                                },
                              ),

                              SizedBox(height: 10.h),
                              SharedTextFormField(
                                controller: context
                                    .read<RegisterCubit>()
                                    .emailController,

                                hintText: 'Email',
                                validator: (String) {
                                  if (String!.isEmpty) {
                                    return "Please enter your email";
                                  }
                                },
                              ),

                              SizedBox(height: 10.h),
                              GestureDetector(
                                onTap: () async {
                                  DateTime now = DateTime.now();

                                  DateTime lastAllowed = DateTime(
                                    now.year - 18,
                                    now.month,
                                    now.day,
                                  );

                                  final DateTime? pickedDate =
                                      await showDatePicker(
                                        context: context,
                                        initialDate: lastAllowed,
                                        firstDate: DateTime(1940),
                                        lastDate: lastAllowed,
                                      );
                                  if (pickedDate != null) {
                                    String formattedDate = DateFormat(
                                      'dd/MM/yyyy',
                                    ).format(pickedDate);
                                    context
                                            .read<RegisterCubit>()
                                            .birthDateController
                                            .text =
                                        formattedDate;
                                    print(formattedDate);
                                  }
                                },
                                child: SharedTextFormField(
                                  enabled: false,
                                  controller: context
                                      .read<RegisterCubit>()
                                      .birthDateController,
                                  suffixIcon: Icon(Icons.calendar_today),

                                  hintText: 'Birth date',
                                  validator: (String) {
                                    if (String!.isEmpty) {
                                      return "Please enter your birth date";
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                          .animate()
                          .move(
                            begin: Offset(0, -screenHeight),
                            end: Offset(0, 0),
                            duration: 1.seconds,
                            curve: Curves.easeOut,
                          )
                          .fadeIn(),

                      Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.h),
                              SharedTextFormField(
                                controller: context
                                    .read<RegisterCubit>()
                                    .phoneController,

                                prefixIcon: Icon(Icons.flag),
                                hintText: 'Phone number',
                                validator: (String) {
                                  if (String!.isEmpty) {
                                    return "Please enter your phone number";
                                  }
                                },
                              ),

                              SizedBox(height: 5.h),
                              BlocBuilder<RegisterCubit, RegisterState>(
                                buildWhen: (current, previous)=> current is ChangePasswordVisibility,
                                builder: (context, state) {
                                  print("rebuild inner BlocBuilder Password");
                                  var cubit = context.read<RegisterCubit>();
                                  return SharedTextFormField(
                                    isObscureText: cubit.isObscureText,
                                    controller: context
                                        .read<RegisterCubit>()
                                        .passwordController,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        cubit.changePasswordVisibility();
                                      },
                                      icon:cubit.isObscureText? Icon(Icons.visibility_off): Icon(Icons.visibility),
                                    ),
                                    hintText: 'Password',
                                    validator: (String) {
                                      if (String!.isEmpty) {
                                        return "Please enter your password";
                                      }
                                    },
                                  );
                                },
                              ),

                              SizedBox(height: 15.h),
                              Text(
                                "Register as",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              BlocBuilder<RegisterCubit, RegisterState>(
                                buildWhen: (previous, current) =>
                                    current
                                        is ChangeType, // بس لما النوع يتغير,
                                builder: (context, state) {
                                  var cubit = context.read<RegisterCubit>();
                                  print("rebuild inner Blocbuilder type");
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: RadioListTile<String>(
                                          title: AutoSizeText(
                                            "Driver",
                                            maxLines: 1,
                                            maxFontSize: 15.sp.roundToDouble(),
                                            minFontSize: 5.sp.roundToDouble(),
                                          ),
                                          value: "Driver",
                                          activeColor: AppColors.mainColor,
                                          groupValue: cubit.type,
                                          onChanged: (value) {
                                            cubit.changeType(value!);
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile<String>(
                                          title: AutoSizeText(
                                            "Passenger",
                                            maxLines: 1,
                                            maxFontSize: 15.sp.roundToDouble(),
                                          ),
                                          value: "Passenger",
                                          activeColor: AppColors.mainColor,
                                          groupValue: cubit.type,
                                          onChanged: (value) {
                                            cubit.changeType(value!);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),

                              SizedBox(height: 20.h),

                              // Register Button
                              BlocBuilder<RegisterCubit, RegisterState>(
                                buildWhen: (previous, current) =>
                                    current is RegisterationLoading ||
                                    current is RegisterationSuccess ||
                                    current is RegisterationError,

                                builder: (context, state) {
                                  var cubit = context.read<RegisterCubit>();
                                  print("rebuild inner BlocBuilder button");
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 50.h,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.mainColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (cubit.formKey.currentState!
                                            .validate()) {
                                          cubit.register();
                                        }
                                      },
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              SizedBox(height: 20.h),

                              // Already have account
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account? ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pushAndRemoveUntil(loginScreen);
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.mainColor,

                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                          .animate()
                          .slide(
                            begin: const Offset(0, 1), // يطلع من تحت
                            end: const Offset(0, 0),
                            duration: 1.seconds,
                            curve: Curves.easeOut,
                          )
                          .fadeIn(),
                      BlocListener<RegisterCubit, RegisterState>(
                        listener: (context, state) async {
                          if (state is RegisterationLoading) {
                            dialogLoading(context);
                          }
                          if (state is RegisterationSuccess) {
                             await CacheHelper.putString(key: "uid",value: state.userModel.uid);
                            Navigator.pop(context);
                            if(state.userModel.userType=="Passenger"){
                              context.pushAndRemoveUntil(passengerHome);
                            }
                            else{
                              context.pushAndRemoveUntil(driverSetData);
                            }
                            showSuccToast(context, "تم التسجيل بنجاح");
                          }
                          if (state is RegisterationError) {
                            Navigator.pop(context);
                            showErrorToast(context, state.errorMessage);
                          }
                        },
                        child: SizedBox.shrink(),
                      ),
                    ],
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
