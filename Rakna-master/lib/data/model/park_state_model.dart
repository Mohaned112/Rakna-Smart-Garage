import '../../domain/entities/parkSate.dart';

class ParkStateModel extends ParkStateData {
  const ParkStateModel(
      {required super.parkSlotName,
      required super.parkName,
      required super.location,
      required super.userName,
      required super.id,
      required super.parkPrice,
      required super.endHour,
      required super.startHour,
      required super.isCash,
      required super.parkState,
      required super.parkCode,
      required super.reservationDuration,
      required super.userForeignKey,
      required super.userPhoneNumber,
      required super.slotId,
      required super.longitude,
      required super.latitude});

  factory ParkStateModel.fromJson(Map<String, dynamic> json) => ParkStateModel(
        id: json['id'],
        parkSlotName: json['parkSlotName'],
        parkName: json['parkName'],
        location: json['location'],
        userName: json['userName'],
        parkPrice: json['parkPrice'],
        startHour: json['startHour'],
        endHour: json['endHour'],
        parkState: json['parkState'],
        isCash: json['isCash'],
        userPhoneNumber: json['userPhoneNumber'],
        reservationDuration: json['reservationDuration'],
        parkCode: json['parkCode'],
        userForeignKey: json['userForeignKey'],
        slotId: json['slotID'],
        longitude: json['longitude'],
        latitude: json['latitude'],
      );
}
