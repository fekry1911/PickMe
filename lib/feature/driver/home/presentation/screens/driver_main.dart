import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalni1/feature/driver/home/logic/driver_home_cubit.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../map.dart';

class DriverMainHome extends StatelessWidget {
  const DriverMainHome({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<DriverHomeCubit>();
    var uid=CacheHelper.getString(key: "uid");
    return Center(
      child:SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
              " ألصفحه الرئيسيه",
              style: GoogleFonts.aboreto(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor,
              ),
            ),
        
            BlocListener<DriverHomeCubit,DriverHomeState>(listener: (context,state){
        
            },
            child: StreamBuilder<bool>(
              stream: cubit.getAvailabilityStream(uid),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
        
                final isAvailable = snapshot.data!;
        
                return Switch(
                  activeColor: AppColors.mainColor,
                  value: isAvailable,
                  onChanged: (value) {
                   cubit.setAvailability(uid, value);
                  },
                );
              },
            )
              ,
            ),
            Container(
                height: 400,
                width: double.infinity,
                child: MapWithSearchAndRoute()),
          ]
        ),
      )
    );
  }
}
