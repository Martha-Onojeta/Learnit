import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/app_color.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/main.dart';
import 'package:learning_app/pages/welcome_screen/bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      pageviewWidget(context,
                          title: 'First See Learning',
                          subTitle:
                              'Forget about a for of paper all knowledge in one learning',
                          btnName: 'Next',
                          imagePath: 'assets/images/reading.png',
                          index: 1),
                      pageviewWidget(context,
                          title: 'Connect With Everyone',
                          subTitle:
                              'Always keep in touch with your tutor & friend. Let\'s get connected',
                          btnName: 'Next',
                          imagePath: 'assets/images/boy.png',
                          index: 2),
                      pageviewWidget(context,
                          title: 'Always Fascinated Learning',
                          subTitle:
                              'Anywhere, anytime. The time is at our discretion so study whenever you want',
                          btnName: 'Get Started',
                          imagePath: 'assets/images/man.png',
                          index: 3),
                    ],
                  ),
                  Positioned(
                      bottom: 70.h,
                      child: DotsIndicator(
                        position: state.page.toInt(),
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            color: AppColors.primaryThirdElementText,
                            activeColor: AppColors.primaryElement,
                            size: const Size.square(8),
                            activeSize: const Size(18, 8),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget pageviewWidget(BuildContext context,
      {required int index,
      required String title,
      required String subTitle,
      required String btnName,
      required String imagePath}) {
    return Column(
      children: [
        SizedBox(height: 345.w, width: 345.w, child: Image.asset(imagePath)),
        Text(
          title,
          style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              Global.storageService
                  .setBool(AppConstant.STORAGE_DEVICE_OPEN_TIME, true);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/sign_in', (route) => false);
              //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyHomePage(title: 'title')));
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
                child: Text(btnName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal))),
          ),
        )
      ],
    );
  }
}
