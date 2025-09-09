import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalni1/feature/splash_screen/presentation/widgets/car_animation.dart';
import 'package:wasalni1/feature/splash_screen/presentation/widgets/text_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
