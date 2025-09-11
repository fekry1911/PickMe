import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalni1/core/theme/colors.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          " Driver home",
          style: GoogleFonts.aboreto(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}
