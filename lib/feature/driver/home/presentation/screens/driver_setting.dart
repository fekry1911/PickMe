import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalni1/core/helpers/context_extention.dart';
import 'package:wasalni1/feature/login/logic/login_cubit.dart';

import '../../../../../core/const/const.dart';
import '../../../../../core/theme/colors.dart';

class DriverSetting extends StatelessWidget {
  const DriverSetting({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " Driver Setting",
            style: GoogleFonts.aboreto(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
            ),
            onPressed: () {
              cubit.signOut();
            },
            child: Text("Sign Out",style: GoogleFonts.aboreto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            )),
          ),
          BlocListener<LoginCubit,LoginState>(listener: (context,state){
            if(state is SignOutSuccess){
              context.pushAndRemoveUntil(loginScreen);
            }
          },
          child: SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
