import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextAnimate extends StatelessWidget {
  const TextAnimate({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child:
          Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome",
                    style: GoogleFonts.aboreto(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "To Wasalni",
                    style: GoogleFonts.aboreto(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
              .animate()
              .move(
                begin: Offset(0, -screenHeight),
                end: Offset(0, 0),
                duration: 1.5.seconds,
                curve: Curves.easeOut,
              )
              .then(delay: .5.seconds)
              .shake(duration: 2.seconds, curve: Curves.easeInOut)
              .then(delay: .5.seconds)
              .move(
                begin: Offset(0, 0),
                end: Offset(0, -screenHeight),
                duration: 1.5.seconds,
                curve: Curves.easeIn,
              ),
    );
  }
}
