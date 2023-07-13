part of 'parking_slots_bloc.dart';

abstract class ParkingSlotEvent extends Equatable {
  const ParkingSlotEvent();

  @override
  List<Object> get props => [];
}
class GetParkingSlotDataEvent extends ParkingSlotEvent {}
