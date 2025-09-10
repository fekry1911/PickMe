import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CarAnimation extends StatelessWidget {
  const CarAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Lottie.asset("assets/animations/Hatchback.json", width: screenWidth-100.w)
    ) .animate()
        .move(
      begin: Offset(-screenWidth, 0),
      end: Offset(0, 0),
      duration: 1.seconds,
      curve: Curves.easeOut,
    )
        .then(delay: 1.4.seconds)
        .move(
      begin: Offset(0, 0),
      end: Offset(screenWidth, 0),
      duration: 1.seconds,
      curve: Curves.easeIn,
    );
  }
}
