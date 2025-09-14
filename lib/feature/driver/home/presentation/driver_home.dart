import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalni1/core/theme/colors.dart';
import 'package:wasalni1/feature/driver/home/logic/driver_home_cubit.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverHomeCubit, DriverHomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<DriverHomeCubit>();
        return Scaffold(

          body: cubit.screens[cubit.index],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
            currentIndex: cubit.index,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            selectedItemColor: AppColors.mainColor,
            unselectedItemColor: Colors.grey,
          ),
        );
      },
    );
  }
}
