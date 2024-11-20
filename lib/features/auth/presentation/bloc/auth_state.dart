part of 'auth_bloc.dart';


class AuthLoginState{
  RequestState? requestState;
  bool? loggedIn;
  String? errorMessage;

  AuthLoginState({this.requestState, this.loggedIn, this.errorMessage});

  AuthLoginState copyWith(
      {RequestState? requestState, String? errorMessage, bool? loggedIn}){

    return AuthLoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      loggedIn: loggedIn ?? this.loggedIn,
      requestState: requestState ?? this.requestState
    );
  }
}
class AuthInit extends AuthLoginState{
  AuthInit():super(
    errorMessage: "",
    loggedIn: false,
    requestState: RequestState.init
  );
}


