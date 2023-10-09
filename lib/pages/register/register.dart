import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/register/register_controller.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:learning_app/pages/sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: authAppBar(title: 'Sign Up'),
      body: SingleChildScrollView(
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: reUseableText(
                        text: 'Enter your details below and free sign up')),
                Container(
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reUseableText(text: 'User name'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          hintText: 'Enter your username',
                          textType: 'email',
                          iconName: 'user',
                          function: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(UserNameEvent(value));
                          }),
                      reUseableText(text: 'Email'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          hintText: 'Enter email address',
                          textType: 'email',
                          iconName: 'user',
                          function: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RegisterEmailEvent(value));
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
                                .read<RegisterBloc>()
                                .add(RegisterPasswordEvent(value));
                          }),
                      reUseableText(text: 'Cinfirm Password'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          hintText: 'Enter your confirm password',
                          textType: 'password',
                          iconName: 'lock',
                          function: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RePasswordEvent(value));
                          }),
                      reUseableText(
                          text:
                              'By creating an account you have agree to our terms and condition')
                    ],
                  ),
                ),
                buildLoginButton(
                    btnName: 'Sign up',
                    btnType: 'login',
                    function: () {
                      RegisterController(context: context)
                          .handleEmailRegister();
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}

/* password = 123456 */