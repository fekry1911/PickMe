import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalni1/core/const/const.dart';
import 'package:wasalni1/core/helpers/context_extention.dart';

import '../../../../../core/theme/colors.dart';

class PassengerHomeMain extends StatelessWidget {
  PassengerHomeMain({super.key});

  List items = [
    {"text": "أجرة", "image": "assets/images/اجره.jpg"},
    {"text": "ملاكي", "image": "assets/images/ملاكي.jpg"},
    {"text": "توكتوك", "image": "assets/images/توكتوك.jpg"},
    {"text": "موتوسيكل", "image": "assets/images/موتوسيكل.jpeg"},
    {"text": "عجلة", "image": "assets/images/عجله.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            context.pushNamed(allDrivers,arguments: items[index]["text"]);

          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    items[index]["image"]!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 100.h,
                    cacheHeight: (100.h * MediaQuery.of(context).devicePixelRatio).toInt(),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.white, Colors.white.withOpacity(0.0)],
                        stops: [0.0, 0.5],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      items[index]["text"]!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aboreto(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      )
                  ),
                ),
              ],
            ),
          ).animate().slideY(
            duration: 500.ms,
            begin: index>2 ? 1.0 : index==2?0.0:-1.0,
            end: 0.0,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height:10.h);
      },
      itemCount: items.length,
    );
  }
}
