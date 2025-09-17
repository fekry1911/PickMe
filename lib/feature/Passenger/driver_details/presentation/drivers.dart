import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalni1/core/shred_widgets/animations/loading.dart';
import 'package:wasalni1/core/shred_widgets/animations/no_data.dart';
import 'package:wasalni1/core/theme/colors.dart';
import 'package:wasalni1/feature/Passenger/driver_details/logic/type_drivers_cubit.dart';

class DriverCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('بيانات السائق', style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: BlocConsumer<TypeDriversCubit, TypeDriversState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.read<TypeDriversCubit>();
          var driver = cubit.drivers;
          if (state is TypeDriversLoading) {
            return LoadingShared();
          }
          if (state is TypeDriversEmpty) {
            return NoData();
          }
          return ListView.builder(
            itemCount: driver.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.all(7.w),
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
                      height: 130.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                          image: NetworkImage(driver[index].profileImage ?? ""),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.h,),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // اسم السائق
                          AutoSizeText(
                            maxLines: 1,

                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            driver[index].name,
                            style: GoogleFonts.aboreto(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8.h),

                          // رقم الهاتف
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.phone, size: 18.w, color: Colors.blue),
                              SizedBox(width: 8.w),
                              Text(
                                driver[index].phone,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          StreamBuilder(
                            stream: cubit.getAvailabilityStream(
                              cubit.drivers[index].uid,
                            ),
                            builder: (context, asyncSnapshot) {
                              if (!asyncSnapshot.hasData)
                                return CircularProgressIndicator();
                              final isAvailable = asyncSnapshot.data!;

                              return Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: isAvailable
                                      ? Colors.green[100]
                                      : Colors.red[100],
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        isAvailable
                                            ? Icons.check_circle
                                            : Icons.cancel,
                                        size: 16.w,
                                        color: isAvailable
                                            ? Colors.green[800]
                                            : Colors.red[800],
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        isAvailable ? 'نشط' : 'غير نشط',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: isAvailable
                                              ? Colors.green[800]
                                              : Colors.red[800],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // حالة السائق
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
