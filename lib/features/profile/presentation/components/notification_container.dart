

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/colors.dart';

class NotificationContainerItem extends StatelessWidget {

  NotificationContainerItem({required this.text, required this.itemSwitched,required this.onChanged});
  final String text;
  final bool itemSwitched;
  final void Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 62.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        child: Row(children: [
          Padding(
            padding:EdgeInsetsDirectional.only(start: 20.w,top: 10.h),
            child: Text(text),
          ),
          Spacer(),
          Switch(value: itemSwitched, onChanged: onChanged)
        ]));
  }
}