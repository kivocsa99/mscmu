import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAffect extends HookWidget {
  final double? width;
  final double? height;
   const ShimmerAffect(
    {Key? key, this.width,
    this.height,}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          height: height,
          width: width,
          color: Colors.grey,
        ),
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!);
  }
}
