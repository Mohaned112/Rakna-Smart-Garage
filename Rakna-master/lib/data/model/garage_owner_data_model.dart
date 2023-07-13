import '../../domain/entities/garage_owner_data.dart';

class GarageOwnerDataModel extends GarageOwnerData {
  const GarageOwnerDataModel({
    required super.email,
    required super.password,
    required super.garageOwnerId,
    required super.phoneNumber,
    required super.age,
    required super.garageOwnerImage,
    required super.garageOwnerName,
  });

  factory GarageOwnerDataModel.fromJson(Map<String, dynamic> json) =>
      GarageOwnerDataModel(
        email: json['email'],
        password: json['password'],
        garageOwnerId: json['garageOwnerID'],
        phoneNumber: json['phoneNumber'],
        age: json['age'],
        garageOwnerImage: json['garageOwnerImage'],
        garageOwnerName: json['userName'],
      );
}
