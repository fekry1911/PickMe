import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Register Screen",style: GoogleFonts.alice(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),),),

    );
  }
}
