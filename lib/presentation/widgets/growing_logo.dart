import 'package:flutter/material.dart';

class GrowingLogo extends AnimatedWidget {
  GrowingLogo({Key? key, AnimationController? controller})
      : super(key: key, 
            listenable: Tween<double>(begin: 0, end: 200).animate(controller!));

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;
    return SizedBox(
      width: animation.value,
      height: animation.value,
      child: Image.asset("images/logo.png"),
    );
  }
}


