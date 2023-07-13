import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rakna/domain/entities/user_data_entities.dart';
import 'package:rakna/domain/usecase/sign_up_user_usecase.dart';

import '../../../core/utility/enums.dart';

part 'sign_in_user_event.dart';

part 'sign_in_user_state.dart';

class SignInUserBloc extends Bloc<SignInUserEvent, SignInUserState> {
  final SignInUserUseCase signInUserUseCase;

  String userEmail;
  String userPassword;
  List x = [];
  bool y = true;

  SignInUserBloc({
    required this.signInUserUseCase,
     this.userEmail = '',
     this.userPassword = '',
  }) : super(const SignInUserState()) {
    on<SignInUserEvent>((event, emit) async {
      final result = await signInUserUseCase.call();
      emit(
        const SignInUserState(requestState: RequestState.loaded),
      );
      print(result.toString());
      if (result.toString().contains(userEmail) &&
          result.toString().contains(userPassword)) {
        return result.fold(
            (l) => emit(SignInUserState(
                  requestState: RequestState.error,
                  message: l.statusMessage,
                )),
            (r) => emit(SignInUserState(
                  requestState: RequestState.loaded,
                  userData: r,
                )));
      }

      result.fold(
        (l) => emit(
          SignInUserState(
            requestState: RequestState.error,
            message: l.statusMessage,
          ),
        ),
        (r) => emit(
          SignInUserState(
            requestState: RequestState.loaded,
            userData: r,
          ),
        ),
      );

      ///todo condition of the check SIGN IN here
      // result.foldLeft(SignInUserState(), (previous, r) => SignInUserState(
      //   requestState: ,
      //   userData: ,
      //   message: ,
      // ));
    });
  }
}
