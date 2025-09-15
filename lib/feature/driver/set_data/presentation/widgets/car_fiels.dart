import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/shred_widgets/shared_text_form_field.dart';
import '../../../../../core/theme/colors.dart';

class CarData extends StatelessWidget {
  var cubit;

  CarData({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,

          children: [
            SizedBox(height: 20.h),

            AutoSizeText(
              "Complete your driver setup 🚗",
              maxLines: 1,
              minFontSize: 16,
              maxFontSize: 24,
              style: GoogleFonts.alice(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainColor,
              ),
            ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.3, end: 0),

            SizedBox(height: 20.h),

            // Car Model
            SharedTextFormField(
              hintText: "Car Model",
              validator: (value) =>
                  value!.isEmpty ? "Enter your car model" : null,
              controller: cubit.carModelController,
            ),
            SizedBox(height: 16.h),

            // Car Plate Number
            SharedTextFormField(
              hintText: "Car Plate Number",
              validator: (value) =>
                  value!.isEmpty ? "Enter your car plate number" : null,
              controller: cubit.carPlateController,
            ),
            SizedBox(height: 16.h),

            // License Number
            SharedTextFormField(
              hintText: "License Number",
              validator: (value) =>
                  value!.isEmpty ? "Enter your license number" : null,
              controller: cubit.licenseController,
            ),
            SizedBox(height: 16.h),

            // Car Type Dropdown
            DropdownButtonFormField<String>(
              value: cubit.carType,
              focusColor: AppColors.mainColor,
              decoration: const InputDecoration(
                labelText: "Car Type",
                border: OutlineInputBorder(),
              ),
              dropdownColor: Colors.white,
              // الخلفية بيضا
              style: TextStyle(
                color: AppColors.mainColor, // الكلام اسود
                fontSize: 16.sp,
              ),
              items: ["ملاكي", "أجرة","موتوسيكل", "عجلة", "توكتوك"]
                  .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                  .toList(),
              onChanged: (value) {
                cubit.carType = value;
              },
              validator: (value) => value == null ? "اختر نوع العربية" : null,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
