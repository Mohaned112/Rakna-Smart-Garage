part of 'parking_slots_bloc.dart';

class ParkingSlotState extends Equatable {

  final List<ParkingSlot> parkingSlot;
  final RequestState requestState;
  final String message;

  const ParkingSlotState({
    this.parkingSlot = const [],
    this.requestState = RequestState.loading,
    this.message = '',
  });

  @override
  @override
  List<Object> get props => [parkingSlot, requestState, message]; ///todo test
}


