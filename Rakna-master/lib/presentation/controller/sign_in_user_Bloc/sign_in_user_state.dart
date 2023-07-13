part of 'sign_in_user_bloc.dart';

class SignInUserState extends Equatable {
  final List<UserData> userData;
  final RequestState requestState;
  final String message;

  const SignInUserState({
    this.userData = const [],
    this.requestState = RequestState.loading,
    this.message = '',
  });

  @override
  List<Object> get props => [userData, requestState, message]; ///todo test
}

