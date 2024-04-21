import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/colors.dart';

class DefaultAppBar extends StatelessWidget {
   DefaultAppBar({Key? key,this.title,this.actions,this.leading,this.backgroundColor=Colors.transparent, this.hasTitle=false, this.hasLeading=false, this.hasActions=false}) : super(key: key);
 final Widget? title;
 final Widget? leading;
 final List<Widget>? actions;
 final Color? backgroundColor;
 final   bool hasTitle;
 final   bool hasLeading;
 final   bool hasActions;


  @override
  Widget build(BuildContext context) {
    return
         AppBar(title: hasTitle ?title:null ,centerTitle: true,elevation: 0,
          backgroundColor:backgroundColor
          ,leading: hasLeading? leading:null,actions: hasActions ?actions:null,);


  }
}
