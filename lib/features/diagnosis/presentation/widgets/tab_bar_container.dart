import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import '../../../../core/utilis/colors.dart';

class TabBarContainer extends StatelessWidget {
  const TabBarContainer({super.key,required this.text});
   final String text;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      width: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:AppColors.primary,shape: BoxShape.rectangle),
      child: Center(child: Text(text.tr(context))),
    );
  }
}
