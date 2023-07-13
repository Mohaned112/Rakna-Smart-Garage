
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/data/repository/parking_repository.dart';
import 'package:rakna/domain/entities/garage_owner_data.dart';

import '../../../core/utility/enums.dart';
import '../../../domain/usecase/sign_in_garage_owner_usecase.dart';

part 'sign_in_garage_owner_event.dart';

part 'sign_in_garage_owner_state.dart';

class SignInGarageOwnerBloc extends Bloc<SignInGarageOwnerEvent, SignInGarageOwnerState> {
  final SignInGarageOwnerUseCase signInGarageOwnerUseCase;

  String userEmail;
  String userPassword;
  List x = [];
  bool y = true;

  SignInGarageOwnerBloc({
    required this.signInGarageOwnerUseCase,
    this.userEmail = '',
    this.userPassword = '',
  }) : super(SignInGarageOwnerState()) {
    on<SignInGarageOwnerEvent>((event, emit) async {
      final result = await SignInGarageOwnerUseCase(
              ParkingRepository(ParkingRemoteDataSource())).call();
      emit(
        const SignInGarageOwnerState(requestState: RequestState.loaded),
      );
      print(result.toString());
      if (result.toString().contains(userEmail) &&
          result.toString().contains(userPassword)) {
        return result.fold(
            (l) => emit(SignInGarageOwnerState(
                  requestState: RequestState.error,
                  message: l.statusMessage,
                )),
            (r) => emit(SignInGarageOwnerState(
                  requestState: RequestState.loaded,
                  garageOwnerData: r,
                )));
      }

      result.fold(
        (l) => emit(
          SignInGarageOwnerState(
            requestState: RequestState.error,
            message: l.statusMessage,
          ),
        ),
        (r) => emit(
          SignInGarageOwnerState(
            requestState: RequestState.loaded,
            garageOwnerData: r,
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
