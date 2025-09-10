import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalni1/core/helpers/context_extention.dart';
import 'package:wasalni1/feature/splash_screen/presentation/widgets/car_animation.dart';
import 'package:wasalni1/feature/splash_screen/presentation/widgets/text_animate.dart';

import '../../../core/const/const.dart';
import '../../../core/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5),()async{
      context.pushAndRemoveUntil(loginScreen);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextAnimate(),
          SizedBox(height: 10.h),
          CarAnimation(),
        ],
      ),
    );
  }
}
