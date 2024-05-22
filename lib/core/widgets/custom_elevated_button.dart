import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({Key? key,required this.child,required this.onpress,this.width,this.buttonBackground}) : super(key: key);

  VoidCallback onpress;
  Widget child;

  double? width;
  Color? buttonBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(backgroundColor:buttonBackground ),
        child: child,
      ),
    );
  }
}