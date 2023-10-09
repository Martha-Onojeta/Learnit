part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  final String userName;
  const UserNameEvent(this.userName);
}

class RegisterEmailEvent extends RegisterEvent {
  final String email;
  const RegisterEmailEvent(this.email);
}

class RegisterPasswordEvent extends RegisterEvent {
  final String password;
  const RegisterPasswordEvent(this.password);
}

class RePasswordEvent extends RegisterEvent {
  final String rePassword;
  const RePasswordEvent(this.rePassword);
}
