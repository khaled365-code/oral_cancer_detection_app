import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/splash/presentation/componants/custom_container.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainer(conHeight:43,conWidth:56,conImage:'assets/plus.png'),
        Text(
          ' Consult',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
