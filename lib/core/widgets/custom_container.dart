import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key, required this.conHeight, required this.conWidth,  required this.conImage,
  });

  final double conHeight;
  final double conWidth;
  final String conImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:conHeight,
      width:conWidth,
      decoration:BoxDecoration(
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
        image: DecorationImage(
          image: conImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}