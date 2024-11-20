import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signup_entity.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/signup_use_case.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/resources/enums.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthLoginState> {
  LoginUSeCase loginUSeCase;
  SignupUseCase signupUseCase;
  TextEditingController emailCotroller = TextEditingController();
  TextEditingController passwordCotroller = TextEditingController();
  TextEditingController nameCotroller = TextEditingController();
  TextEditingController phoneCotroller = TextEditingController();
  TextEditingController rePasswordCotroller = TextEditingController();
  TextEditingController emailUpCotroller = TextEditingController();
  TextEditingController passwordUpCotroller = TextEditingController();
  AuthBloc(this.loginUSeCase,this.signupUseCase) : super(AuthInit()) {
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
    on<SignUpEvent>((event, emit) async {
      emit(state.copyWith(
          requestState: RequestState.loading,

          errorMessage: ""));
      var data = await signupUseCase.call(event.signUpEntity);

      data.fold(
        (l) {
          emit(state.copyWith(
              requestState: RequestState.error,

              errorMessage: l.message));
        },
        (r) {
          emit(state.copyWith(
              errorMessage: "",
              requestState: RequestState.success));
        },
      );

    });


  }
}
