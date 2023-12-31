import 'package:bloc/bloc.dart';
import 'package:learning_app/pages/register/register.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<UserNameEvent>(_userNameEvent);
    on<RegisterEmailEvent>(_emailEvent);
    on<RegisterPasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    print('${event.userName}');
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(RegisterEmailEvent event, Emitter<RegisterState> emit) {
    print('${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(
      RegisterPasswordEvent event, Emitter<RegisterState> emit) {
    print('${event.password}');
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    print('${event.rePassword}');
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
