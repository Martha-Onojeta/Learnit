import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/app_color.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_bloc.dart';

AppBar courseDetailAppBar() {
  return AppBar(centerTitle: true, title: reusableText('Course detail')
      //reuseableText(text: ),
      );
}

Widget thunbnail(String thumbnail) {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage('${AppConstant.SERVER_UPLOADS}$thumbnail'))),
  );
}

Widget menuView() {
  return Container(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: AppColors.primaryElement),
            child: reusableText('Author Page',
                color: AppColors.primaryElementText,
                fontWeight: FontWeight.normal,
                fontSize: 10.sp),
          ),
        ),
        _iconAndNum('assets/icons/people.png', 0),
        _iconAndNum('assets/icons/star.png', 0),
      ],
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        reusableText(num.toString(),
            color: AppColors.primaryThirdElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal)
      ],
    ),
  );
}

Widget decriptionText(String description) {
  return reusableText(description,
      //'Flutter is a cross-platform app development framework developed by google used to build beautiful UI. The most exciting thing about flutter is that dart language which is it programming language is relatively easy to learn. It can be used to develop applications for 6 different platforms android, iOS, web, MacOS, Windows and Linux. So this series of articles serves as a building block for learning how to work with JSON data which is the most popular way in which most API return da',
      //'Course Descriptioncourse Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description Course Description',
      color: AppColors.primaryThirdElementText,
      fontWeight: FontWeight.normal,
      fontSize: 11.sp);
}

Widget goBuyButton(String btnName) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
              color: Colors.grey.withOpacity(.1)),
        ]),
    child: Center(
      child: Text(
        btnName,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.primaryBackground),
      ),
    ),
  );
}

void func() {}
Widget courseSummaryView(BuildContext context, CourseDetailState state) {
  var imagesInfo = <String, String>{
    '${state.courseItem!.video_length ?? '0'} Hours Video': 'video_detail.png',
    'Total ${state.courseItem!.lesson_num ?? '0'} lessons ': 'file_detail.png',
    '${state.courseItem!.down_num ?? '0'} Downloadable Resources':
        'download_detail.png',
  };
  return Column(
    children: [
      ...List.generate(
          imagesInfo.length,
          (index) => GestureDetector(
                //onTap: func,
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.primaryElement),
                        child: Image.asset(
                          'assets/icons/${imagesInfo.values.elementAt(index)}',
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      reusableText(imagesInfo.keys.elementAt(index),
                          fontSize: 11.sp)
                    ],
                  ),
                ),
              ))
    ],
  );
}

Widget courseLessonList(CourseDetailState state) {
  return Container(
    width: 325.w,
    height: 80.h,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 1))
        ]),
    child: InkWell(
      onTap: () {},
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            '${AppConstant.SERVER_UPLOADS}${state.courseItem!.thumbnail}'))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _listContainer(text: state.courseItem!.name.toString()),
                  _listContainer(
                      text: state.courseItem!.description.toString(),
                      fontSize: 10,
                      color: AppColors.primaryThirdElementText,
                      fontWeight: FontWeight.normal),
                ],
              )
            ],
          ),
          Image(
              height: 24.h,
              width: 24.h,
              image: const AssetImage(
                'assets/icons/arrow_right.png',
              )),
        ],
      ),
    ),
  );
}

Widget _listContainer(
    {double fontSize = 13,
    String text = '',
    Color color = AppColors.primaryText,
    fontWeight = FontWeight.bold}) {
  return Container(
    margin: EdgeInsets.only(left: 6.w),
    width: 200.w,
    child: Text(
      text,
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
    ),
  );
}
