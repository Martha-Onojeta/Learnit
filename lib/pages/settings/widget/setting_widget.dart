import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Container(child: reusableText('Settings')),
  );
}

Widget settingsButton(BuildContext context, void Function()? function) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm logout'),
              content: const Text('Confirm logout'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel')),
                TextButton(onPressed: function, child: const Text('Confirm'))
              ],
            );
          });
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/icons/Logout.png'))),
    ),
  );
}
