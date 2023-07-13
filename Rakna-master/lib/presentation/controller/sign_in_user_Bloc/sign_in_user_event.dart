part of 'sign_in_user_bloc.dart';

abstract class SignInUserEvent extends Equatable {
  const SignInUserEvent();

  @override
  List<Object> get props => [];
}

class GetDataUserEvent extends SignInUserEvent {}
