import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/app_color.dart';

AppBar authAppBar({
  required String title,
}) {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.5),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1.5,
        )),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.primaryText),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context, {required String iconNaame}) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset('assets/icons/$iconNaame.png'),
      ),
    ),
  );
}

Widget reUseableText({required String text}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(.5),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(
    {required String hintText,
    required String textType,
    required String iconName,
    void Function(String value)? function}) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        SizedBox(
          width: 270,
          height: 50.h,
          child: TextField(
            onChanged: (value) => function!(value),
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
            cursorColor: Colors.grey,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  const TextStyle(color: AppColors.primarySecondaryElementText),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              errorBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
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
  );
}

Widget forgetPassword() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(left: 25.w),
      width: 200.w,
      height: 44.h,
      child: Text(
        'Forget password',
        style: TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            fontSize: 12.sp,
            decorationColor: AppColors.primaryText),
      ),
    ),
  );
}

Widget buildLoginButton(
    {required String btnName,
    required String btnType,
    void Function()? function}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: btnType == 'login' ? 40.h : 20.h),
      decoration: BoxDecoration(
          color: btnType == 'login'
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            color: btnType == 'login'
                ? Colors.transparent
                : AppColors.primaryFourElementText,
          ),
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
              color: btnType == 'login'
                  ? AppColors.primaryBackground
                  : AppColors.primaryText),
        ),
      ),
    ),
  );
}
