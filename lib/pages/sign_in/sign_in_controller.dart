import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learning_app/common/apis/user_api.dart';
import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/common/widgets/toast.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/home_page/home_controller.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        //to access SignInBloc
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String passwordAddress = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: 'You need to fill in email address');
          return;
        }
        if (passwordAddress.isEmpty) {
          toastInfo(msg: 'You need to fill in password');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: passwordAddress);
          if (credential.user == null) {
            toastInfo(msg: 'You don\'t exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'You need to verify your email account');
            return;
          }
          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            print('my url is ${photoUrl}');

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            //type 1 means email login
            loginRequestEntity.type = 1;

            print('user open_id ${id}');
            print('user photoUrl ${photoUrl}');

            print('user exist');
            await asynPostAllData(loginRequestEntity);
            if (context.mounted) {
              await HomeController(context: context).init();
            }

            //got verified user from firebase
          } else {
            toastInfo(msg: 'Currently you are not a user of this app');
            return;
            //got error verifying user from firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for that email');
          } else if (e.code == 'wrong password') {
            toastInfo(msg: 'Wrong password provided for that user');
            print('Wrong password provided for that user');
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'your email address format is wrong');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> asynPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    var result = await UserAPI.login(param: loginRequestEntity);
    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstant.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        //used forauthorization, that's why we saved it.
        print(
            '..................my token is${result.data!.access_token}......................');
        Global.storageService.setString(
            AppConstant.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();
        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/application', (route) => false);
        }
      } catch (e) {
        print('saving local storage error ${e.toString()}');
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: 'unknown error');
    }
  }
}
