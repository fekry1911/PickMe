import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalni1/core/const/const.dart';
import 'package:wasalni1/core/helpers/context_extention.dart';
import 'package:wasalni1/feature/splash_screen/presentation/widgets/car_animation.dart';
import 'package:wasalni1/feature/splash_screen/presentation/widgets/text_animate.dart';

import '../../../core/helpers/cache_helper.dart';
import '../../../core/theme/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextAnimate()
              .animate()
              .move(
                begin: Offset(0, -screenHeight), // يبدأ من فوق
                end: Offset(0, 0), // ينزل مكانه
                duration: 1.seconds,
                curve: Curves.easeOut,
              )
              .then(delay: .5.seconds)
              .shake(duration: 1.seconds, curve: Curves.easeInOut)
              .then(delay: 1.4.seconds) // 👈 نفس تأخير العربية
              .move(
                begin: Offset(0, 0),
                end: Offset(screenHeight, 0), // 👈 يخرج يمين مع العربية
                duration: 1.seconds,
                curve: Curves.easeIn,
              ),
          SizedBox(height: 10.h),
          CarAnimation()
              .animate() // هنا مفيش !
              .move(
                begin: Offset(-screenWidth, 0),
                end: Offset(0, 0),
                duration: 2.seconds,
                curve: Curves.easeOut,
              )
              .then(delay: 1.4.seconds)
              .move(
                begin: Offset(0, 0),
                end: Offset(screenWidth, 0),
                duration: 1.seconds,
                curve: Curves.easeIn,
              )
              .then()
              .callback(
                callback: (_) async {
                  String? type =  CacheHelper.getString(key: "type") ;
                  String? uid =  CacheHelper.getString(key: "uid");
                  bool? carDataFinished = CacheHelper.getBoolean(key: "carDataFinished");
                  print(uid);
                  print(type);
                  print(carDataFinished);
                  if(uid !=null){
                    if(type=="passenger"){
                      context.pushAndRemoveUntil(passengerHome);
                    }
                    if(type=="Driver"){
                      if(carDataFinished==true){
                        context.pushAndRemoveUntil(driverHome);
                      }else{
                        context.pushAndRemoveUntil(driverSetData);
                      }

                    }

                  }
                  else{
                    context.pushAndRemoveUntil(loginScreen);
                  }
                },
              ),
        ],
      ),
    );
  }
}
