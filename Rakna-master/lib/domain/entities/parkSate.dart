import 'package:equatable/equatable.dart';

class ParkStateData extends Equatable {
  final int id;
  final String parkName;
  final String location;
  final double parkPrice;
  final String parkState;
  final bool isCash;
  final String userName;
  final String parkCode;
  final int reservationDuration;
  final String startHour;
  final String endHour;
  final String userPhoneNumber;
  final String parkSlotName;
  final int userForeignKey;
  final double latitude;
  final double longitude;
  final int slotId;

  const ParkStateData({
    required this.parkSlotName,
    required this.parkName,
    required this.location,
    required this.userName,
    required this.id,
    required this.parkPrice,
    required this.endHour,
    required this.startHour,
    required this.isCash,
    required this.parkState,
    required this.parkCode,
    required this.reservationDuration,
    required this.userForeignKey,
    required this.userPhoneNumber,
    required this.slotId,
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object> get props =>
      [
        id,
        parkName,
        location,
        parkPrice,
        parkState,
        isCash,
        userName,
        parkCode,
        reservationDuration,
        startHour,
        endHour,
        userPhoneNumber,
        parkSlotName,
        userForeignKey,
        latitude,
        longitude,
        slotId,
      ];
}
