import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          ,leading: hasLeading? leading:GestureDetector(
             onTap: ()
             {
               Navigator.pop(context);
             }, child: Icon(Icons.arrow_back_ios_outlined,size: 16.sp,)),actions: hasActions ?actions:null,);


  }
}
