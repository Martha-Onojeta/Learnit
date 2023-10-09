import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:learning_app/pages/sign_in/sign_in_controller.dart';
import 'package:learning_app/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: authAppBar(title: 'Log In'),
      body: SingleChildScrollView(
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Padding(
                    padding: EdgeInsets.only(left: 50.w, right: 50.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildThirdPartyLogin(context, iconNaame: 'google'),
                        buildThirdPartyLogin(context, iconNaame: 'apple'),
                        buildThirdPartyLogin(context, iconNaame: 'facebook'),
                      ],
                    ),
                  ),
                ),
                Center(
                    child: reUseableText(text: 'Or use your account to login')),
                Container(
                  margin: EdgeInsets.only(top: 66.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reUseableText(text: 'Email'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          hintText: 'Enter email address',
                          textType: 'email',
                          iconName: 'user',
                          function: (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                      reUseableText(text: 'Password'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          hintText: 'Enter your password',
                          textType: 'password',
                          iconName: 'lock',
                          function: (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                    ],
                  ),
                ),
                forgetPassword(),
                SizedBox(
                  height: 70.h,
                ),
                buildLoginButton(
                    btnName: 'Log in',
                    btnType: 'login',
                    function: () {
                      SignInController(context: context).handleSignIn('email');
                    }),
                buildLoginButton(
                    btnName: 'Sign up',
                    btnType: 'register',
                    function: () {
                      Navigator.of(context).pushNamed('/register');
                    })
              ],
            );
          },
        ),
      ),
    );
  } /*
onojetamartha94@gmail.com Password =atr456
 */
}

/* password = 123456 */