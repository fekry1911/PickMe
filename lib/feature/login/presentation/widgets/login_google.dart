import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';

class LoginGoogle extends StatelessWidget {
   LoginGoogle({super.key, required this.onPressed});
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.greyColor)
      ),
      child: MaterialButton(onPressed:onPressed, child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/google.png",width: 20.w,height: 20.h,),
          SizedBox(width: 10.w,),
          Text("Login with Google",style: GoogleFonts.nunito(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.strongGrey,
          ))
        ]
      )),
    );
  }
}
