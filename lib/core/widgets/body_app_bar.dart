
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyAppBar extends StatelessWidget {
  const BodyAppBar({super.key, this.title, this.leading, this.actions, this.backgroundColor, this.hasTitle=false,  this.hasLeading=false, this.hasActions=false});

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final   bool hasTitle;
  final   bool hasLeading;
  final   bool hasActions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
       if(hasLeading==true)
         leading ?? SizedBox.shrink(),
        Spacer(),
        if(hasTitle==true)
          title ?? SizedBox.shrink(),
        Spacer(),
        if(hasActions==true)
          Row(
            children: actions??
                [
                  const SizedBox.shrink(),
                ],
          ),
        SizedBox(width: 35.w,),
      ],
    );
  }
}
