// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graduation_project/core/localization/app_localization.dart';
// import '../../../../../core/routes/routes.dart';
// import '../../../../../core/utilis/image_constants.dart';
// import '../../../../../core/utilis/app_colors.dart';
// import '../../../../../core/utilis/app_text_styles.dart';
// import 'onboarding_component.dart';
// import '../../../../../core/commons/functions.dart';
//
//
// class PageViewOnBoarding extends StatefulWidget {
//   const PageViewOnBoarding({Key? key}) : super(key: key);
//
//   @override
//   State<PageViewOnBoarding> createState() => PageViewOnBoardingState();
// }
//
// class PageViewOnBoardingState extends State<PageViewOnBoarding> {
//
//   final PageController pageController = PageController(initialPage: 0);
//   int currentPage = 0;
//
//   final List<Widget> pages = [
//      Builder(
//        builder: (context) {
//          return OnboardingPage(
//           textButton: TextButton(onPressed: (){
//             navigate(context: context, route: Routes.registerScreen);
//             }
//            ,child: Text('skip'.tr(context),style: AppTextStyles.font15.copyWith(color: AppColors.primary,fontWeight: FontWeight.bold),)),
//           title: 'firstonboardtilte'.tr(context),
//           description: 'firstonboarddesc'.tr(context),
//           imagePath: ImageConstants.onBoard1,
//     );
//        }
//      ),
//      Builder(
//        builder: (context) {
//          return OnboardingPage(
//           title: 'secondonboardtitle'.tr(context),
//           description: 'secondonboarddesc'.tr(context),
//           imagePath: ImageConstants.onBoard2,
//     );
//        }
//      ),
//   ];
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: PageView.builder(
//             controller: pageController,
//             itemCount: pages.length,
//             onPageChanged: (int page) {
//               setState(() {
//                 currentPage = page;
//               });
//             },
//             itemBuilder: (BuildContext context, int index) {
//               return pages[index];
//             },
//           ),
//         ),
//         buildPageIndicator(),
//          SizedBox(height: 28.h),
//         buildNavigationButtons(),
//          SizedBox(height: 20.h,)
//       ],
//     );
//   }
//   Widget buildPageIndicator() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: pages.map((Widget page) {
//         int pageIndex = pages.indexOf(page);
//         return Container(
//           width: 8.w,
//           height: 8.w,
//           margin:  EdgeInsetsDirectional.symmetric(horizontal: 4.w),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: pageIndex == currentPage ? AppColors.primary : Colors.grey,
//           ),
//         );
//       }).toList(),
//     );
//   }
//
//
//     Widget buildNavigationButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         TextButton(
//           style: ButtonStyle(
//               foregroundColor: MaterialStateProperty.all(AppColors.primary)),
//           onPressed: () {
//             pageController.previousPage(
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeInOut,
//             );
//           },
//           child:  Text('Previous'.tr(context)),
//         ),
//         TextButton(
//           style: ButtonStyle(
//               foregroundColor: MaterialStateProperty.all(AppColors.primary)),
//
//           onPressed: () {
//             if (currentPage == pages.length - 1) {
//               // SharedPreferences.getInstance().then((prefs) {
//               //   prefs.setBool('isFirstTimeUser', false);
//               //   navigate(context: context, route: Routes.registerScreen);
//               // });
//               navigate(context: context, route: Routes.registerScreen);
//             } else {
//               pageController.nextPage(
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeInOut,
//               );
//             }
//           },
//           child: Text(currentPage == pages.length - 1 ? 'Finish'.tr(context) : 'Next'.tr(context)),
//         ),
//       ],
//     );
//   }
//
//
// }
//
