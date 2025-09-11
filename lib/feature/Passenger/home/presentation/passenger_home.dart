import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';

class PassengerHome extends StatelessWidget {
  const PassengerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Passenger Home",
          style: GoogleFonts.aboreto(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor,
          ))),
    );
  }
}
