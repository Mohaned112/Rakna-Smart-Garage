part of 'get_garage_owner_parking_bloc.dart';


class GarageOwnerParkingState extends Equatable {
  final List<GarageOwnerParking> parking;
  final RequestState requestState;
  final String message;

  const GarageOwnerParkingState({
    this.parking = const [],
    this.requestState = RequestState.loading,
    this.message = '',
  });

  @override
  List<Object> get props => [
    parking,
    requestState,
    message,
  ];
}
