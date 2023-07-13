import 'dart:ffi';

import 'package:equatable/equatable.dart';

class GarageOwnerParking extends Equatable {
  final List parkingData;

  const GarageOwnerParking({
    required this.parkingData
  });

  @override
  List<Object> get props => [parkingData];
}
