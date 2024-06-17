// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomQuestionsContainer extends StatelessWidget {
//   const CustomQuestionsContainer({super.key,this.backGroundColor,required this.backgroundImage, this.borderRadius,required this.child,this.height,this.width});
//
//   final Widget child;
//   final double? width;
//   final double? height;
//   final Color? backGroundColor;
//   final BorderRadiusGeometry? borderRadius;
//   final ImageProvider backgroundImage;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//             image: DecorationImage(image: backgroundImage,fit: BoxFit.fill,opacity:1 ),
//             // color:backGroundColor?? AppColors.primary,
//             borderRadius: borderRadius,
//             border: Border.all(
//               color: Colors.white,
//               width: 4.0.w,)
//         ),
//         child: child,
//       ),
//     );
//   }
// }