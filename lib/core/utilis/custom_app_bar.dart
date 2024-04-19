import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/colors.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key,required this.title,this.actions,this.leading,this.backgroundColor=Colors.transparent}) : super(key: key);
 final Widget title;
 final Widget? leading;
 final List<Widget>? actions;
 final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return
         AppBar(title:title ,centerTitle: true,elevation: 0,
      backgroundColor:backgroundColor
          ,leading: leading,actions: actions,);


  }
}
