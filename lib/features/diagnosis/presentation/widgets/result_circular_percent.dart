import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import 'center_circular_percent_widget.dart';

class ResultCircularPercent extends StatelessWidget {
  const ResultCircularPercent({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 35,
      shape: CircleBorder(),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 100.r,
        child: CircularPercentIndicator(
          animationDuration: 1900,
          animation: true,
          radius: 90,
          lineWidth: 20,
          percent:CacheHelper().getData(key: 'probCancer'),
          progressColor: AppColors.primary,
          backgroundColor: AppColors.grey.withOpacity(0.4),
          circularStrokeCap: CircularStrokeCap.butt,
          center: CenterCircularPercentWidget()

        ),
      ),
    );
  }
}
