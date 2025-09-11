import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';

class SetDataPassenger extends StatelessWidget {
  const SetDataPassenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("set Passenger data",
          style: GoogleFonts.aboreto(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor,
          ))),
    );
  }
}
