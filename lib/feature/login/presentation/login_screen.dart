import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalni1/core/helpers/context_extention.dart';
import 'package:wasalni1/core/shred_widgets/toasts/suc.dart';
import 'package:wasalni1/core/theme/colors.dart';
import 'package:wasalni1/feature/login/presentation/widgets/forgot_password.dart';
import 'package:wasalni1/feature/login/presentation/widgets/login_google.dart';
import 'package:wasalni1/feature/login/presentation/widgets/text_desc.dart';
import '../../../core/const/const.dart';
import '../../../core/shred_widgets/buttton.dart';
import '../../../core/shred_widgets/loading.dart';
import '../../../core/shred_widgets/shared_text_form_field.dart';
import '../../../core/shred_widgets/toasts/error.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is GetDataSuccess) {
            if(state.user.userType=="Passenger"){
              context.pushAndRemoveUntil(passengerHome);
            }
            else{
              context.pushAndRemoveUntil(driverHome);
            }
          }
          if (state is GetUserDataFailure) {
            showErrorToast(context, state.error);
          }
          if (state is LoginLoading) {
            dialogLoading(context);
          }
          if (state is LoginSuccess) {
            Navigator.pop(context);
            showSuccToast(context, "Login Sucsefully");
          }
          if (state is LoginFailure) {
            Navigator.pop(context);
            showErrorToast(context, state.error);
          }
        },
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(200.r),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container(color: AppColors.whiteColor)),
                ],
              ),
              Form(
                key: cubit.formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 20.w,
                        left: 20.w,
                        top: 30.w,
                        bottom: 10.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/icons/logo1.png",
                                      width: 50.w,
                                      height: 50.h,
                                    ),
                                    SizedBox(height: 10.h),
                                    TextAndDesc(),
                                    SizedBox(height: 20.h),
                                    LoginGoogle(
                                      onPressed: () {
                                        cubit.signInWithGoogle();
                                      },
                                    ),
                                    SizedBox(height: 20.h),
                                    Center(
                                      child: AutoSizeText(
                                        "------------- or Sign in with Email ------------- ",
                                        maxLines: 1,
                                        minFontSize: 9.sp.roundToDouble(),
                                        maxFontSize: 20.sp.roundToDouble(),
                                        style: GoogleFonts.nunitoSans(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .animate()
                              .move(
                                begin: Offset(0, -screenHeight),
                                end: Offset(0, 0),
                                duration: 1.seconds,
                                curve: Curves.easeOut,
                              )
                              .fadeIn(),
                          Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20.h),
                                    Text(
                                      "Login",
                                      style: GoogleFonts.nunitoSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.strongGrey,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    SharedTextFormField(
                                      controller: cubit.emailController,
                                      hintText: 'mail@abc.com',
                                      validator: (String) {
                                        if (String!.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        return null;
                                      },
                                    ),

                                    SizedBox(height: 10.h),
                                    Text(
                                      "Password",
                                      style: GoogleFonts.nunitoSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.strongGrey,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    SharedTextFormField(
                                      controller: cubit.passwordController,
                                      isObscureText: true,
                                      hintText: '*******************',
                                      validator: (String) {
                                        if (String!.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 5.h),
                                    ForgotPassword(),
                                    SizedBox(height: 15.h),
                                    CustomButton(
                                      text: 'Login',
                                      onPressed: () {
                                        if (cubit.formKey.currentState!
                                            .validate()) {
                                          cubit.signInWithEmail();
                                        } else {
                                          print("error");
                                        }
                                      },
                                    ),
                                    SizedBox(height: 30.h),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: AutoSizeText(
                                              "Don't have an account?",
                                              maxLines: 1,
                                              minFontSize: 5.sp.roundToDouble(),
                                              maxFontSize: 20.sp
                                                  .roundToDouble(),
                                              style: GoogleFonts.nunitoSans(
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.strongGrey,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            child: TextButton(
                                              onPressed: () {
                                                context.pushAndRemoveUntil(registerScreen);
                                              },
                                              child: AutoSizeText(
                                                "Create an account",
                                                maxLines: 1,
                                                minFontSize: 5.sp
                                                    .roundToDouble(),
                                                maxFontSize: 20.sp
                                                    .roundToDouble(),
                                                style: GoogleFonts.nunitoSans(
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColors.mainColor,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .animate()
                              .slide(
                                begin: const Offset(0, 1), // يطلع من تحت
                                end: const Offset(0, 0),
                                duration: 1.seconds,
                                curve: Curves.easeOut,
                              )
                              .fadeIn(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
