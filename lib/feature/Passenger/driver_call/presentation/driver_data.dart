import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalni1/core/shred_widgets/animations/no_data.dart';
import 'package:wasalni1/core/theme/colors.dart';
import 'package:wasalni1/feature/Passenger/driver_call/logic/get_driver_data_cubit.dart';
import 'package:wasalni1/feature/Passenger/driver_call/presentation/widgets/contact.dart';
import 'package:wasalni1/feature/Passenger/driver_call/presentation/widgets/name_car_type.dart';
import 'package:wasalni1/feature/Passenger/driver_call/presentation/widgets/profile_car_image.dart';
import 'package:wasalni1/feature/Passenger/driver_call/presentation/widgets/profile_loadinf.dart';

import '../../../../core/shred_widgets/animations/loading.dart';

class DriverData extends StatelessWidget {
  const DriverData({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.mainColor,
            size: 30.r,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Center(
            child: BlocConsumer<GetDriverDataCubit, GetDriverDataState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var cubit = context.read<GetDriverDataCubit>();
                var driver = cubit.driverModel;
                if (state is GetDriverDataLoading) {
                  return Center(child: ProfileLoading());

                }
                if (state is GetDriverDataError) {
                  return NoData();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileAndCarImage(profileImage: driver!.imageProfile, carImage: driver.imageCar,),
                    SizedBox(height: 70.r),
                    NameAndCarType(name: driver!.name, carType: driver.carType,),
                    SizedBox(height: 50.r),
                    ContactInformation(phone: driver.phone,),
                    SizedBox(height: 50.r),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.mainColor,
                              AppColors.deepMainColor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            "Call",
                            style: GoogleFonts.alice(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
