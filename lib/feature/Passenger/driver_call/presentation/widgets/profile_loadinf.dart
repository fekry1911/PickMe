import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/theme/colors.dart';

class ProfileLoading extends StatelessWidget {
  const ProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: Lottie.asset(
        'assets/animations/profile_loading.json',
        delegates: LottieDelegates(
          values: [
            ValueDelegate.colorFilter(const [
              '**',
            ], value: ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn)),
          ],
        ),
      ),
    );
  }
}
