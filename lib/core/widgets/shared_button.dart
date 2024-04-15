
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {

  final String text;
  final Color? textcolor;
  final double? width;
  final double? height;
  final TextStyle textStyle;
  final Color buttonColor;
  final void Function()? onPressed;
  final bool? hasBorderRadius;
  final double? borderRadiusValue;

  const SharedButton({required this.text, this.textcolor, this.onPressed,  this.width=327,  this.height=42, required this.textStyle, required this.buttonColor, this.hasBorderRadius, this.borderRadiusValue,});
  @override

  Widget build(BuildContext context) {

  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
    borderRadius: hasBorderRadius!?BorderRadius.circular(borderRadiusValue!):BorderRadius.zero,
    color: buttonColor,),
    child:MaterialButton(onPressed: onPressed,
      child: Center(child: Text(text,style:textStyle.copyWith(color: textcolor),)),
    ),
  );

  }
}

