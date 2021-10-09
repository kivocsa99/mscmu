import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

displaySuccessMotionToast(
    BuildContext context, String description, String title) {
  MotionToast.success(
    toastDuration:const Duration(seconds: 3),
    title: title,
    titleStyle: const TextStyle(fontWeight: FontWeight.bold),
    description: description,
    descriptionStyle: const TextStyle(fontSize: 12),
    width: 300,
  ).show(context);
}

displayWarningMotionToast(
    BuildContext context, String description, String title) {
  MotionToast.warning(
    toastDuration: const Duration(seconds: 3),
    title: title,
    titleStyle: const TextStyle(fontWeight: FontWeight.bold),
    description: description,
    borderRadius: 30,
    animationDuration: const Duration(milliseconds: 1000),
  ).show(context);
}

Route createRoute(Widget Function() route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
