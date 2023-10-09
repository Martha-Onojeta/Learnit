import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/app_color.dart';
import 'package:learning_app/pages/home_page/home_page.dart';
import 'package:learning_app/pages/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    HomePage(),
    Center(child: Text('Search')),
    Center(child: Text('Course')),
    Center(child: Text('Chat')),
    const ProfilePage(),
  ];
  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
      label: 'home',
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset('assets/icons/home.png'),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          'assets/icons/home.png',
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: 'Search',
      icon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Image.asset('assets/icons/search.png'),
      ),
      activeIcon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Image.asset(
          'assets/icons/search.png',
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: 'course',
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset('assets/icons/play-circle1.png'),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          'assets/icons/play-circle1.png',
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: 'chat',
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset('assets/icons/message-circle.png'),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          'assets/icons/message-circle.png',
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: 'profile',
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset('assets/icons/person.png'),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          'assets/icons/person.png',
          color: AppColors.primaryElement,
        ),
      )),
];
