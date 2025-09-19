import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/colors.dart';

class ContactInformation extends StatelessWidget {
  String phone;
   ContactInformation({super.key,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Contact Information",
          style: GoogleFonts.alice(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        SizedBox(height: 10.r),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.mainColor,
              child: Icon(
                Icons.phone,
                color: AppColors.whiteColor,
                size: 20.r,
              ),
            ),
            SizedBox(width: 10.r),
            Center(
              child: Text(
                "+2${phone}",
                style: GoogleFonts.alice(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
