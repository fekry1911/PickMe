import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

dialogLoading(context){
  return showDialog(
    context: context,
    builder:
        (context) => Center(
      child: Lottie.asset("assets/animations/Loading (2).json",),
    ).animate().fadeIn(),
  );
}