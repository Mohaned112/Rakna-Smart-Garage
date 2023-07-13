

import 'package:equatable/equatable.dart';

class Parking extends Equatable {
  final int parkId;
  final String parkName;
  final String parkLocation;
  final String parkImage;
  final num parkPrice;
  final num parkingRating;
  final int parkSection;
  final int reservationPlace;
  final double latitude;
  final double longitude;
  final List parkingSlotList;

  const Parking({
    required this.parkId,
    required this.parkName,
    required this.parkLocation,
    required this.parkImage,
    required this.parkPrice,
    required this.reservationPlace,
    required this.parkingRating,
    required this.parkSection,
    required this.latitude,
    required this.longitude,
    required this.parkingSlotList,
  });

  @override
  List<Object> get props =>
      [
        parkId,
        parkName,
        parkLocation,
        parkImage,
        parkPrice,
        parkingRating,
        parkSection,
        reservationPlace,
        latitude,
        longitude,
        parkingSlotList,
      ];
}
