import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

void showWarningToast(BuildContext context, String warningMessage) {
  CherryToast.warning(
    description: Text(
      warningMessage.split('] ').last, // لو الرسالة فيها [code]
      style: const TextStyle(color: Colors.black),
    ),
    toastDuration: const Duration(milliseconds: 3000),
    toastPosition: Position.bottom,
    animationType: AnimationType.fromRight,
    animationDuration: const Duration(milliseconds: 1000),
    autoDismiss: true,
    iconWidget: Icon(Icons.warning, color: Colors.yellow[900]),

  ).show(context);
}
