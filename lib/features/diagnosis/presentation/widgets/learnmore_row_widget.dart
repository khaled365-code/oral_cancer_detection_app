import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utilis/app_text_styles.dart';

class LearnMoreRowWidget extends StatelessWidget {
  const LearnMoreRowWidget({super.key, required this.text, required this.isOneAnswer});
  final String text;
  final bool isOneAnswer;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Padding(
          padding: isOneAnswer?const EdgeInsets.only(bottom: 52):const EdgeInsets.only(bottom: 8),
          child: Icon(FontAwesomeIcons.circle,size: 12,),
        ),
        SizedBox(width: 10.w,),
        Flexible(child: Text(text,style: AppTextStyles.font14,))
      ],
    );
  }
}
