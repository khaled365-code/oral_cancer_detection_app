import 'package:flutter/material.dart';

class CustomFormContainer extends StatelessWidget {
  const CustomFormContainer({super.key, this.borderRadius,required this.child,this.height,this.width});

  final Widget child;
  final double? width;
  final double? height;
   final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: borderRadius
        ),
        child: child,
      ),
    );
  }
}
