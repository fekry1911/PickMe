import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showErrorToast(BuildContext context, String errorMessage) {
  CherryToast.warning(
    height: 50.h,
    width:double.infinity,
    description: Text(
      errorMessage.split('] ').last, // لو الرسالة فيها [code]
      style: const TextStyle(color: Colors.black),
    ),
    toastDuration: const Duration(milliseconds: 3000),
    toastPosition: Position.bottom,
    animationType: AnimationType.fromRight,
    animationDuration: const Duration(milliseconds: 1000),
    autoDismiss: true,
    iconWidget: Icon(Icons.error, color: Colors.red[900]),
  ).show(context);
}
