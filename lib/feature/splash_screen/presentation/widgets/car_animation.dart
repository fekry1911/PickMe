import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wasalni1/core/helpers/context_extention.dart';

import '../../../../core/const/const.dart';

class CarAnimation extends StatelessWidget {
  const CarAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    return Align(
      alignment: Alignment.centerLeft,
      child:Center(
        child: Lottie.asset(
          "assets/animations/Hatchback.json",
          width: screenWidth - 100.w,
        ),
      )
    )
    ;
  }
}
