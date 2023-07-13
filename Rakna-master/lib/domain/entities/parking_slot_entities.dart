import 'package:equatable/equatable.dart';

class ParkingSlot extends Equatable {
  final int slotId;
  final String parkingSlotName;
  final bool isAvailable;
  final int numberOfSlots;
  final int numberOfSections;
  final String startHour;
  final String endHour;
  final String randomNumber;

  const ParkingSlot({
    required this.slotId,
    required this.parkingSlotName,
    required this.isAvailable,
    required this.numberOfSlots,
    required this.numberOfSections,
    required this.startHour,
    required this.endHour,
    required this.randomNumber,
  });

  @override
  List<Object> get props => [
        slotId,
        parkingSlotName,
        isAvailable,
        numberOfSlots,
        numberOfSections,
        startHour,
        endHour,
        randomNumber,
      ];
}
