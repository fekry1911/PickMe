import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalni1/core/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // يخلي الزرار ياخد عرض الشاشة
      height: 45.h,             // ارتفاع ثابت
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor, // نفس الموف اللي ظاهر عندك
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // حواف مدورة
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:  TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white, // النص أبيض
          ),
        ),
      ),
    );
  }
}
