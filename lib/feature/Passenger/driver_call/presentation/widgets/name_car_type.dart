import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/colors.dart';

class NameAndCarType extends StatelessWidget {
  String name;
  String carType;
   NameAndCarType({super.key,required this.name,required this.carType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AutoSizeText(name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          maxFontSize: 30.sp.roundToDouble(),
          minFontSize: 20.sp.roundToDouble(),
          style: GoogleFonts.alice(
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor,
        ),),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.lighterGrey,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(carType,style: GoogleFonts.alice(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.mainColor,
          )),
        ),

      ],
    );
  }
}
