import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key,required this.title,this.actions,this.leading}) : super(key: key);
 final Widget title;
 final Widget? leading;
 final List<Widget>? actions;


  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: AppBar(title:title ,centerTitle: true,elevation: 0,
      backgroundColor: AppColors.transparent
          ,leading: leading,actions: actions,));


  }
}
