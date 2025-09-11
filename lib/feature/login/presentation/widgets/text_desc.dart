import 'package:auto_size_text/auto_size_text.dart';
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
        AutoSizeText(
          "Login to your Account",
          maxLines: 1,
          minFontSize: 20.sp.roundToDouble(),
          maxFontSize: 40.sp.roundToDouble(),

          style: GoogleFonts.nunito(

            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(height: 5.h),
        AutoSizeText(
          "See what is going on with your business",
          maxLines: 1,
          minFontSize: 9.sp.roundToDouble(),
          maxFontSize: 20.sp.roundToDouble(),
          style: GoogleFonts.nunito(
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
