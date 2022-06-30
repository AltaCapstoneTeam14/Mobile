import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidgets extends StatelessWidget {
  final Widget child;
  const ShimmerWidgets({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey.shade300,
      baseColor: Colors.grey.shade100,
      child: child,
    );
  }
}
