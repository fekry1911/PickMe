import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalni1/core/theme/colors.dart';

class TextAndDesc extends StatelessWidget {
  const TextAndDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login to your Account",
          style: GoogleFonts.nunito(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.strongGrey,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          "See what is going on with your business",
          style: GoogleFonts.nunito(
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.strongGrey,
          ),
        ),
      ],
    );
  }
}
