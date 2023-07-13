import 'package:rakna/domain/entities/garage_owner_parking_data.dart';

class GarageOwnerParkingModel extends GarageOwnerParking {
  const GarageOwnerParkingModel({required super.parkingData});

  factory GarageOwnerParkingModel.fromJson(Map<String, dynamic> json) =>
      GarageOwnerParkingModel(
        parkingData: json['parks'],
      );


  Map<String, dynamic> toJson() {
    return {
      'parks': parkingData,
    };
  }

}
