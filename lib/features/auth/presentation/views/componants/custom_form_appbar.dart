import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/widgets/row_title.dart';

class CustomFormAppBar extends StatelessWidget {
  const CustomFormAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor: AppColors.white
      ),
      elevation: 0,
      backgroundColor: AppColors.background,
      title: const RowTitle(),
      titleSpacing: 0,
    );
  }
}