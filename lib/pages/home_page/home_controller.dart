import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/apis/course_api.dart';
import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/home_page/bloc/home_page_bloc.dart';

class HomeController {
  late BuildContext context;

  UserItem? get userProfile => Global.storageService.getUserProfile();

  static final HomeController _singleton = HomeController._internal();

  HomeController._internal();
  //this is factory consructor, make sure that we have original only one instance
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    //  print("...home controller init method...");
    //make sure that user is logged in and then make an api call
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courselist();
      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomePageBloc>().add(HomePageCourseItem(result.data!));
        }

        //print('perfect');
        //print(result.data![1].description);
      } else {
        print(result.code);
      }
    }
  }
}
