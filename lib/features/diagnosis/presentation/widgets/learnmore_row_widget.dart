import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utilis/app_text_styles.dart';

class LearnMoreRowWidget extends StatelessWidget {
  const LearnMoreRowWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(FontAwesomeIcons.circle,size: 12,),
        SizedBox(width: 10.w,),
        Flexible(child: Text(text,style: AppTextStyles.font14,))
      ],
    );
  }
}
