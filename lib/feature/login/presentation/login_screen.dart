import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalni1/core/theme/colors.dart';
import 'package:wasalni1/feature/login/presentation/widgets/forgot_password.dart';
import 'package:wasalni1/feature/login/presentation/widgets/login_google.dart';
import 'package:wasalni1/feature/login/presentation/widgets/text_desc.dart';

import '../../../core/shred_widgets/buttton.dart';
import '../../../core/shred_widgets/shared_text_form_field.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit=context.read<LoginCubit>();
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/icons/logo.png",
                          width: 100.w,
                          height: 100.h,
                        ),
                        SizedBox(height: 10.h),
                        TextAndDesc(),
                        SizedBox(height: 25.h),
                        LoginGoogle(
                          onPressed: (){
                            cubit.signInWithGoogle();
                          },
                        ),
                        SizedBox(height: 30.h),
                        Center(
                          child: Text(
                            "------------- or Sign in with Email ------------- ",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.strongGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().move(
                    begin: Offset(0, -screenHeight),
                    end: Offset(0, 0),
                    duration: 1.seconds,
                    curve: Curves.easeOut,
                  ).fadeIn(),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
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
                          hintText: 'mail@abc.com',
                          validator: (String) {},
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
                          isObscureText: true,
                          hintText: '*******************',
                          validator: (String) {},
                        ),
                        SizedBox(height: 5.h),
                        ForgotPassword(),
                        SizedBox(height: 15.h),
                        CustomButton(text: 'Login', onPressed: () {
                        }),
                        SizedBox(height: 30.h),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.strongGrey,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Create an account",
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).animate()
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
          );
        },
      ),
    );
  }
}
