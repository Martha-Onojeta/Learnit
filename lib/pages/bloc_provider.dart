import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/home_page/bloc/home_page_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:learning_app/pages/welcome_screen/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        /* BlocProvider(
          lazy: false,
          create: (context) => AppBloc(),
        ),*/
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => HomePageBloc(),
        ),
      ];
}
