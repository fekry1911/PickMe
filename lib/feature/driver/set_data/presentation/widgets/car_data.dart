import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/colors.dart';

class CarFiles extends StatelessWidget {
  var cubit;

  CarFiles({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35.r,
                backgroundColor: AppColors.mainColor,
                child: ClipOval(
                  child: (cubit.licenseUrl.isNotEmpty)
                      ? Image.network(
                    cubit.licenseUrl,
                    fit: BoxFit.cover,
                    width: 70.r,
                    height: 70.r,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.camera_alt, color: Colors.white);
                    },
                  )
                      : const Icon(Icons.camera_alt, color: Colors.white),
                ),
              ),
              SizedBox(width: 10.w),
              TextButton(
                onPressed: () {
                  cubit.pickLicense();
                },
                child: AutoSizeText(
                  maxLines: 1,
                  minFontSize:13.sp.roundToDouble(),
                  maxFontSize: 16.sp.roundToDouble(),
                  "Upload License Image",
                  style: GoogleFonts.alice(
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),
          Row(
            children: [
              CircleAvatar(
                radius: 35.r,
                backgroundColor: AppColors.mainColor,
                child: ClipOval(
                  child: (cubit.carUrl.isNotEmpty)
                      ? Image.network(
                    cubit.carUrl,
                    fit: BoxFit.cover,
                    width: 70.r,
                    height: 70.r,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.camera_alt, color: Colors.white);
                    },
                  )
                      : const Icon(Icons.camera_alt, color: Colors.white),
                ),
              ),
              SizedBox(width: 10.w),
              TextButton(
                onPressed: () {
                  cubit.pickCarFile();
                },
                child: AutoSizeText(
                  maxLines: 1,
                  minFontSize:13.sp.roundToDouble(),
                  maxFontSize: 16.sp.roundToDouble(),
                  "Upload Car Image",
                  style: GoogleFonts.alice(
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Row(
            children: [
              CircleAvatar(
                radius: 35.r,
                backgroundColor: AppColors.mainColor,
                child: ClipOval(
                  child: (cubit.profileUrl.isNotEmpty)
                      ? Image.network(
                    cubit.profileUrl,
                    fit: BoxFit.cover,
                    width: 70.r,
                    height: 70.r,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.camera_alt, color: Colors.white);
                    },
                  )
                      : const Icon(Icons.camera_alt, color: Colors.white),
                ),
              ),
              SizedBox(width: 10.w),
              TextButton(
                onPressed: () {
                  cubit.pickProfileFile();
                },
                child: AutoSizeText(
                  maxLines: 1,
                  minFontSize:13.sp.roundToDouble(),
                  maxFontSize: 16.sp.roundToDouble(),
                  "Upload Profile Image",
                  style: GoogleFonts.alice(
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),        ],
      ),
    );
  }
}
