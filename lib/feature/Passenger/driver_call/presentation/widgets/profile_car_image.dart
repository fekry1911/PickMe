import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';

class ProfileAndCarImage extends StatelessWidget {
  String profileImage;
  String carImage;
   ProfileAndCarImage({super.key,required this.profileImage,required this.carImage});

  @override
  Widget build(BuildContext context) {
    return             Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 100.r,
            backgroundColor: AppColors.mainColor,
            child: CircleAvatar(
              radius: 95.r,
              backgroundColor: AppColors.whiteColor,
              child: CircleAvatar(
                radius: 90.r,
                backgroundImage: NetworkImage(
                  profileImage,
                ),
              ),
            ),
          ),
          Positioned(
            right: 100.w,
            top: 100.h,
            child: CircleAvatar(
              radius: 65.r,
              backgroundColor: AppColors.mainColor,
              child: CircleAvatar(
                radius: 60.r,
                backgroundColor: AppColors.whiteColor,
                child: CircleAvatar(
                  radius: 55.r,
                  backgroundImage: NetworkImage(
                    carImage
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
