import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

void showSuccToast(BuildContext context, String succMessage) {
  CherryToast.warning(
    description: Text(
      succMessage.split('] ').last, // لو الرسالة فيها [code]
      style: const TextStyle(color: Colors.black),
    ),
    toastDuration: const Duration(milliseconds: 3000),
    toastPosition: Position.bottom,
    animationType: AnimationType.fromRight,
    animationDuration: const Duration(milliseconds: 1000),
    autoDismiss: true,
    iconWidget: Icon(Icons.done, color: Colors.green[900]),

  ).show(context);
}
