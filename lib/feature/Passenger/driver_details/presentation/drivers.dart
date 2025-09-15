import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Driver {
  final String name;
  final String phoneNumber;
  final bool isActive;
  final String imageUrl;

  Driver({
    required this.name,
    required this.phoneNumber,
    required this.isActive,
    required this.imageUrl,
  });
}

class DriverCardScreen extends StatelessWidget {
  // بيانات السائق الثابتة
  final Driver driver = Driver(
    name: 'أحمد محمد',
    phoneNumber: '+201234567890',
    isActive: true,
    imageUrl:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=100&q=80',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('بيانات السائق', style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: Center(child: DriverCard(driver: driver)),
    );
  }
}

class DriverCard extends StatelessWidget {
  final Driver driver;

  const DriverCard({Key? key, required this.driver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100.h,
          width: double.infinity,
          margin: EdgeInsets.all(7.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // صورة السائق
              Container(
                width: 70.w,
                height: 70.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: driver.isActive ? Colors.green : Colors.grey,
                    width: 2.w,
                  ),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: driver.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.person, size: 40.w),
                  ),
                ),
              ),
              Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // اسم السائق
                  Text(
                    driver.name,
                    style: GoogleFonts.aboreto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // رقم الهاتف
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, size: 18.w, color: Colors.blue),
                      SizedBox(width: 8.w),
                      Text(
                        driver.phoneNumber,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),

              // حالة السائق
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: driver.isActive ? Colors.green[100] : Colors.red[100],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      driver.isActive ? Icons.check_circle : Icons.cancel,
                      size: 16.w,
                      color: driver.isActive
                          ? Colors.green[800]
                          : Colors.red[800],
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      driver.isActive ? 'نشط' : 'غير نشط',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: driver.isActive
                            ? Colors.green[800]
                            : Colors.red[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
