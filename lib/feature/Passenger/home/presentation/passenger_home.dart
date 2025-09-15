import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';
import '../logic/passenger_cubit.dart';

class PassengerHome extends StatelessWidget {
  const PassengerHome({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PassengerCubit>();
    return BlocConsumer<PassengerCubit, PassengerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar:AppBar(
            backgroundColor: AppColors.mainColor,
            title: Text(cubit.titles[cubit.index],style: GoogleFonts.alice(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor

            ),)
          ),
          body: cubit.pages[cubit.index],
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
              currentIndex: cubit.index,
              selectedItemColor: AppColors.mainColor,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                cubit.changeIndex(index);
              }
          ),

        );
      },
    );
  }
}
