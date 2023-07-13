import 'package:equatable/equatable.dart';

import '../../../core/utility/enums.dart';
import '../../../domain/entities/parking.dart';

class ParkingState extends Equatable {
  final List<Parking> parking;
  final RequestState requestState;
  final String message;

  const ParkingState({
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
