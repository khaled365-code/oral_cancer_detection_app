import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/commons.dart';

import '../../../../core/utilis/app_colors.dart';
import '../componants/onboarding_component.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {

  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  final List<Widget> _pages = [
    const OnboardingPage(
      title: 'Welcome to Oral Cancer Detection App',
      description: 'Begin your journey towards early detection and prevention of oral cancer with our advanced image-based diagnosis system.',
      imagePath: AppAssets.onBoard1,
    ),
    const OnboardingPage(
      title: 'Explore and Protect Your Oral Health',
      description: 'Discover the power of our app as you diagnose potential oral cancer symptoms through images and answer critical questions to assess your risk factors. Stay informed with the latest news and join our supportive community to connect with others on a similar journey.',
      imagePath: AppAssets.onBoard2,
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: _pages.length,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index];
                },
              ),
            ),

            _buildPageIndicator(),
            const SizedBox(height: 28),
            _buildNavigationButtons(),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _pages.map((Widget page) {
        int pageIndex = _pages.indexOf(page);
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: pageIndex == currentPage ? AppColors.primary : Colors.grey,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(AppColors.primary)),
          onPressed: () {
            pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: const Text('Previous'),
        ),
        TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(AppColors.primary)),

          onPressed: () {
            if (currentPage == _pages.length - 1) {
              navigate(context: context, route: Routes.registerScreen);
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Text(currentPage == _pages.length - 1 ? 'Finish' : 'Next'),
        ),
      ],
    );
  }
}