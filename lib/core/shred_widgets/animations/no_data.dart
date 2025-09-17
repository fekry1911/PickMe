import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150.h,
        width: double.infinity,
        child: Lottie.asset("assets/animations/noData.json"),
      ),
    );
  }
}
