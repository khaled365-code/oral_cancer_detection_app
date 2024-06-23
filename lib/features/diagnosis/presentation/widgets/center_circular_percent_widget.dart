import 'package:flutter/cupertino.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/utilis/app_text_styles.dart';

class CenterCircularPercentWidget extends StatelessWidget {
  const CenterCircularPercentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75),
      child: Column(
        children: [
          Text("Probability of Cnacer",style: AppTextStyles.font12,),
          Text('${(CacheHelper().getData(key: 'probCancer')*100).toStringAsFixed(0)}%')
        ],
      ),
    );
  }
}
