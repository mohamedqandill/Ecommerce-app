import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/forget_password_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/new_pass_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/reset_code_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/signup_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/enums.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthLoginState> {
  LoginUSeCase loginUSeCase;
  SignupUseCase signupUseCase;
  NewPassUSeCase newPassUSeCase;
  ForgetPasswordUSeCase forgetPasswordUSeCase;
  ResetCodeUSeCase resetCodeUSeCase;
  TextEditingController emailCotroller = TextEditingController();
  TextEditingController newPassCotroller = TextEditingController();
  TextEditingController resetCodeCotroller = TextEditingController();
  TextEditingController emailConfirmCotroller = TextEditingController();
  TextEditingController passwordCotroller = TextEditingController();
  TextEditingController nameCotroller = TextEditingController();
  TextEditingController phoneCotroller = TextEditingController();
  TextEditingController rePasswordCotroller = TextEditingController();
  TextEditingController emailUpCotroller = TextEditingController();
  TextEditingController passwordUpCotroller = TextEditingController();

  AuthBloc(this.loginUSeCase, this.signupUseCase, this.forgetPasswordUSeCase,
      this.resetCodeUSeCase,this.newPassUSeCase)
      : super(AuthInit()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(
          requestState: RequestState.loading,
          loggedIn: false,
          errorMessage: ""));
      var data = await loginUSeCase.call(event.email, event.password);

      data.fold(
        (l) {
          emit(state.copyWith(
              requestState: RequestState.error,
              loggedIn: false,
              errorMessage: l.message));
        },
        (r) {
          emit(state.copyWith(
              errorMessage: "",
              loggedIn: r,
              requestState: RequestState.success));
        },
      );
    });
    on<NewPasswordEvent>((event, emit) async {
      emit(state.copyWith(
          requestState: RequestState.loading,
          loggedIn: false,
          errorMessage: ""));
      var data = await newPassUSeCase.call(event.email, event.password);

      data.fold(
        (l) {
          emit(state.copyWith(
              requestState: RequestState.error,
              loggedIn: false,
              errorMessage: l.message));
        },
        (r) {
          emit(state.copyWith(
              errorMessage: "",
              loggedIn: r,
              requestState: RequestState.success));
        },
      );
    });
    on<ForgetPasswordEvent>((event, emit) async {
      emit(state.copyWith(
          requestState: RequestState.loading,
          loggedIn: false,
          errorMessage: ""));
      var data = await forgetPasswordUSeCase.call(event.email);

      data.fold(
        (l) {
          emit(state.copyWith(
              requestState: RequestState.error,
              loggedIn: false,
              errorMessage: l.message));
        },
        (r) {
          emit(state.copyWith(
              errorMessage: "",
              loggedIn: r,
              requestState: RequestState.success));
        },
      );
    });
    on<ResetCodeEvent>((event, emit) async {
      emit(state.copyWith(
          requestState: RequestState.loading,
          loggedIn: false,
          errorMessage: ""));
      var data = await resetCodeUSeCase.call(event.code);

      data.fold(
        (l) {
          emit(state.copyWith(
              requestState: RequestState.error,
              loggedIn: false,
              errorMessage: l.message));
        },
        (r) {
          emit(state.copyWith(
              errorMessage: "",
              loggedIn: r,
              requestState: RequestState.success));
        },
      );
    });
    on<SignUpEvent>((event, emit) async {
      emit(
          state.copyWith(requestState: RequestState.loading, errorMessage: ""));
      var data = await signupUseCase.call(event.signUpEntity);

      data.fold(
        (l) {
          emit(state.copyWith(
              requestState: RequestState.error, errorMessage: l.message));
        },
        (r) {
          emit(state.copyWith(
              errorMessage: "", requestState: RequestState.success));
        },
      );
    });
  }
}
