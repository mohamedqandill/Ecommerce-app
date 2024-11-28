part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {

  String email;
  String password;

  LoginEvent(this.email, this.password);
}class NewPasswordEvent extends AuthEvent {

  String email;
  String password;

  NewPasswordEvent(this.email, this.password);
}
class ForgetPasswordEvent extends AuthEvent {

  String email;


  ForgetPasswordEvent(this.email);
}class ResetCodeEvent extends AuthEvent {

  String code;


  ResetCodeEvent(this.code);
}


class SignUpEvent extends AuthEvent {
  SignUpEntity signUpEntity;
  SignUpEvent(this.signUpEntity);
}

