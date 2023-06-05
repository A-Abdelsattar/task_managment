import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding/onboarding.dart';
import 'package:tasks_app/screens/register_screen.dart';
import 'package:tasks_app/utils/app_navigator.dart';

import '../src/app_colors_class.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   width: 0.0,
          //   color: background,
          // ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 45.0.w,
                  vertical: 90.0.h,
                ),
                child: Image.asset('assets/image/onboarding1.jpg',
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome, Track your tasks progress',
                    style: TextStyle(
                      color: AppColors.kMainColor,
                      fontSize: 23.0.sp,
                      wordSpacing: 1.w,
                      letterSpacing: 1.2.w,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0.w, vertical: 20.0.h),
                child:const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Never forget important things',
                    style: TextStyle(
                      color: AppColors.kMainColor
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration:const BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   width: 0.0,
          //   color: background,
          // ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 45.0.w,
                  vertical: 90.0.h,
                ),
                child: Image.asset('assets/image/onboarding2.jpg',
                    ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your personal task manager',
                    style: TextStyle(
                      color: AppColors.kMainColor,
                      fontSize: 23.0.sp,
                      wordSpacing: 1.w,
                      letterSpacing: 1.2.w,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0.w,vertical: 20.0.h),
                child:const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Free up some time for yourself',
                    style: TextStyle(
                      color: AppColors.kMainColor
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration:const BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   width: 0.0,
          //   color: Colors.blue,
          // ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 45.0.w,
                   vertical: 90.0.h,
                ),
                child: Image.network('https://img.freepik.com/free-vector/event-management-performance-efficiency-time-optimization-reminder-task-project-deadline-flat-design-element-appointment-date-reminding_335657-2664.jpg',
                    ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Complete tasks easily',
                    style: TextStyle(
                      color: AppColors.kMainColor,
                      fontSize: 23.0.sp,
                      wordSpacing: 1.w,
                      letterSpacing: 1.2.w,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0.w, vertical: 10.0.h),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Leave no job behind',
                    style: TextStyle(
                      color: AppColors.kMainColor
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color:  defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          AppNavigator.navigateToNewScreen(context, RegisterScreen(), true);
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.kMainColor,
                // border: Border.all(
                //   width: 0.0,
                //   color: background,
                // ),
              ),
              child: ColoredBox(
                color: AppColors.kMainColor,
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          indicatorDesign: IndicatorDesign.line(
                            lineDesign: LineDesign(
                              lineType: DesignType.line_uniform,
                            ),
                          ),
                        ),
                      ),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}