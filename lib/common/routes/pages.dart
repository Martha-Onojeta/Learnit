import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/routes/route.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/application/application_page.dart';
import 'package:learning_app/pages/application/bloc/app_bloc.dart';
import 'package:learning_app/pages/course/bloc/course_detail_bloc.dart';
import 'package:learning_app/pages/course/course_detail.dart';
import 'package:learning_app/pages/home_page/bloc/home_page_bloc.dart';
import 'package:learning_app/pages/home_page/home_page.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/register/register.dart';
import 'package:learning_app/pages/settings/bloc/settings_bloc.dart';
import 'package:learning_app/pages/settings/settings_page.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:learning_app/pages/sign_in/sign_in.dart';
import 'package:learning_app/pages/welcome_screen/bloc/welcome_bloc.dart';
import 'package:learning_app/pages/welcome_screen/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(create: (_) => AppBloc())),
      PageEntity(
          route: AppRoutes.HOME,
          page: const HomePage(),
          bloc: BlocProvider(create: (_) => HomePageBloc())),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(create: (_) => SettingsBloc())),
      PageEntity(
          route: AppRoutes.COURSE_DETAIL,
          page: const CourseDetailPage(),
          bloc: BlocProvider(create: (_) => CourseDetailBloc())),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  // a model that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigation get trigger
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        //print('first log');
        //print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          // print('second log');
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print('Invalid route name ${settings.name}');
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

//unify  Blocprovider, routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}





/*class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.initial,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          route: AppRoutes.signIn,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          route: AppRoutes.register,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
        route: AppRoutes.application,
        page: const Welcome(),
        // bloc: BlocProvider(create: (_)=>WelcomeBloc())
      ),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a model that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigation get trigger
      var result = routes().where((element) => element.route == settings.name);
      if (result.isEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}*/

