
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_khaled_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/core/widgets/shared_button.dart';
import 'package:graduation_project/features/home/data/models/carousel_data_model/carousel_data_model.dart';
import 'package:graduation_project/features/home/presentation/widgets/dot_container.dart';

class SliderContent extends StatelessWidget {
  const SliderContent({super.key, required this.carouselDataModel,required this.carouselDataList});

 final List<CarouselDataModel> carouselDataList;
  final CarouselDataModel carouselDataModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
       clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.c2C81FF,
          ),
          child: Row(
            children:
            [
              SizedBox(width: 18.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h,),
                  ResuableText(
                    text: carouselDataModel.advertisementText,
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(),
                  SharedButton(btnText: carouselDataModel.btnText, onPressed: (){},
                    width: 109.w,
                    height: 38.h,
                    hasBorderRadius: true,
                    borderRadiusValue: 25,
                    buttonColor: AppColors.white,
                    btnTextStyle: AppKhaledStyles.textStyle(
                      color: AppColors.c3284FF,
                      size: 12,
                      weight: FontWeight.w400,

                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: MediaQuery.of(context).size.width/3/1.2),
                    child: Row(
                        children: carouselDataList.asMap().entries.map((entry) {
                          return DotContainer(
                            indicatorIsActive: entry.key == carouselDataList.indexOf(carouselDataModel),
                          );
                        }).toList()
                    ),
                  ),
                  SizedBox(height: 13.h,)


                ],
              ),
            ],
          ),
        ),
        PositionedDirectional(
          start: 180.w,
            child: Container(
                height: 250.h,
                child: Image.asset(carouselDataModel.carouselImage,fit: BoxFit.cover,))),

      ],
    );
  }
}
