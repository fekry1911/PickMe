import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingShared extends StatelessWidget {
  const LoadingShared({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 100.h,
              width: double.infinity,
              margin: EdgeInsets.all(10.w),
              child: Lottie.asset("assets/animations/loading (3).json"));
        },
        itemCount: 5,
      ),
    );
  }
}
