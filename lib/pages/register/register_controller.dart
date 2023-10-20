import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/common/widgets/toast.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({required this.context});

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: 'User name cannot be empty');
    }
    if (email.isEmpty) {
      toastInfo(msg: 'Email cannot be empty');
    }
    if (password.isEmpty) {
      toastInfo(msg: 'Password cannot be empty');
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: 'Your password cornfirmation is wrong');
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl = "uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(
            msg:
                'An email has been sent to your registered email. To activate it please check your email box and click ok');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
      }
      if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      }
      if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email is invalid");
      }
    }
  }
}
/*
onojetamartha94@gmail.com Password =atr456
 */