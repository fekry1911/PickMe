import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text("Forgot Password", style: GoogleFonts.nunitoSans(
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.mainColor,
            )),
          ),
        ],
      ),
    );
  }
}
