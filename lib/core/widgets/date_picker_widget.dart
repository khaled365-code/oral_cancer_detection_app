





import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utilis/app_colors.dart';

class CustomDatePicker extends StatelessWidget {
  final Widget child;
  const CustomDatePicker({super.key,required this.child});

  @override
  Widget build(BuildContext context) {


    return Container(
      width: 327,
      height: 48,
      color: AppColors.str.withOpacity(.2),
      child: child,
    );

  }
}

