part of 'get_parking_data_bloc.dart';

abstract class ParkingEvent extends Equatable {
  const ParkingEvent();

  @override
  List<Object> get props => [];
}

class GetParkingDataEvent extends ParkingEvent {}
