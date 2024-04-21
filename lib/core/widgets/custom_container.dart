import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key, required this.conHeight,
    required this.conWidth,  required this.conImage,this.borderRadius
  });

  final double conHeight;
  final double conWidth;
  final String conImage;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:conHeight,
      width:conWidth,
      decoration:BoxDecoration(
        borderRadius:borderRadius ,
        image: DecorationImage(
          image: AssetImage(conImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}




class UImageContainer extends StatelessWidget {
  const UImageContainer({
    super.key, required this.conHeight, required this.conWidth,  required this.conImage,
  });

  final double conHeight;
  final double conWidth;
  final ImageProvider conImage;


  @override
  Widget build(BuildContext context) {
    return Container(
      height:conHeight,
      width:conWidth,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: conImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}