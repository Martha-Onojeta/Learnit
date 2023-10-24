import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/common/values/app_color.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';
import 'package:learning_app/pages/home_page/bloc/home_page_bloc.dart';

AppBar buildAppBar(String avatar) {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          '${AppConstant.SERVER_API_URL}${avatar}'))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 5}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.h),
            color: AppColors.primaryBackground,
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 17.h),
                width: 16.w,
                height: 16.h,
                child: Image.asset('assets/icons/search.png')),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                autocorrect: false,
                obscureText: false,
                cursorColor: Colors.grey,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: 'Search your text',
                  hintStyle:
                      TextStyle(color: AppColors.primarySecondaryElementText),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp),
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.w),
            color: AppColors.primaryElement,
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}

Widget slidersView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 168.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBloc>().add(HomePageDots(value));
            // print(value.toString());
          },
          children: [
            _slidersContainer(path: 'assets/icons/Art.png'),
            _slidersContainer(path: 'assets/icons/Image_1.png'),
            _slidersContainer(path: 'assets/icons/Image_2.png')
          ],
        ),
      ),
      DotsIndicator(
        position: state.index.toInt(),
        dotsCount: 3,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(8),
            activeSize: const Size(18, 8),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      )
    ],
  );
}

Widget _slidersContainer({String path = 'assets/icons/Art.png'}) {
  return Container(
    width: 325.w,
    height: 162.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText('Choose your course'),
            GestureDetector(
              child: reusableText('See all',
                  color: AppColors.primaryThirdElementText, fontSize: 14),
            )
          ],
        ),
      ),
      Row(
        children: [
          _reuseableMenuText('All'),
          _reuseableMenuText('Popular',
              textColor: AppColors.primaryThirdElementText,
              bgColor: Colors.white),
          _reuseableMenuText('Newest',
              textColor: AppColors.primaryThirdElementText,
              bgColor: Colors.white),
        ],
      )
    ],
  );
}

Widget _reuseableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color bgColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.only(top: 20.h),
    child: Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.w),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(7.w),
          border: Border.all(color: bgColor)),
      child: reusableText(menuText,
          color: textColor, fontWeight: FontWeight.normal, fontSize: 14),
    ),
  );
}

Widget courseGrid(CourseItem item) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(AppConstant.SERVER_UPLOADS + item.thumbnail!))),
    child: Container(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            item.name ?? '',
            textAlign: TextAlign.left,
            softWrap: false,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
                color: AppColors.primaryElementText,
                fontWeight: FontWeight.bold,
                fontSize: 11.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            item.description ?? '',
            textAlign: TextAlign.left,
            softWrap: false,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
                color: AppColors.primaryFourElementText,
                fontWeight: FontWeight.normal,
                fontSize: 8.sp),
          ),
        ],
      ),
    ),
  );
}
