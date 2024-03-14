import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({Key? key,required this.onpress,required this.child,this.style,this.width}) : super(key: key);
  String? buttonName;
  VoidCallback onpress;
  Widget child;
  ButtonStyle? style;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: onpress,
        style: style,
        child: child,
      ),
    );
  }
}