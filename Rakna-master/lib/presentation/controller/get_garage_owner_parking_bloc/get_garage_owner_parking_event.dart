part of 'get_garage_owner_parking_bloc.dart';

abstract class GarageOwnerParkingEvent extends Equatable {
  const GarageOwnerParkingEvent();

  @override
  List<Object> get props => [];
}

class GetGarageOwnerParkingEvent extends GarageOwnerParkingEvent {}
