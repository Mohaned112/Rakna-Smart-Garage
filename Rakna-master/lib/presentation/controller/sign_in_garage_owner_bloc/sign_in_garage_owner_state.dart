part of 'sign_in_garage_owner_bloc.dart';

class SignInGarageOwnerState extends Equatable {
  final List<GarageOwnerData> garageOwnerData;
  final RequestState requestState;
  final String message;

  const SignInGarageOwnerState({
    this.garageOwnerData = const [],
    this.requestState = RequestState.loading,
    this.message = '',
  });

  @override
  List<Object> get props => [
        garageOwnerData,
        requestState,
        message,
      ];
}
