import 'package:rakna/domain/entities/parking_slot_entities.dart';


class ParkingSlotModel extends ParkingSlot {
  const ParkingSlotModel({
    required super.slotId,
    required super.parkingSlotName,
    required super.isAvailable,
    required super.numberOfSlots,
    required super.numberOfSections,
    required super.startHour,
    required super.endHour,
    required super.randomNumber,
  });

  factory ParkingSlotModel.fromJson(Map<String, dynamic> json) =>
      ParkingSlotModel(
        slotId: json['id'],
        parkingSlotName: json['parkingSlotName'].toString(),
        isAvailable: json['isAvailable'],
        numberOfSlots: json['numberOfSlots'],
        numberOfSections: json['numberOfSections'],
        startHour: json['startHour'].toString(),
        endHour: json['endHour'].toString(),
        randomNumber: json['randomNumber'].toString(),
      );
}
