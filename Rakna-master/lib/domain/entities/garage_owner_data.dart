import 'package:equatable/equatable.dart';

class GarageOwnerData extends Equatable {
  final String garageOwnerName;
  final String email;
  final String password;
  final String garageOwnerImage;
  final int garageOwnerId;
  final String phoneNumber;
  final int age;

  const GarageOwnerData({
    required this.email,
    required this.password,
    required this.garageOwnerId,
    required this.phoneNumber,
    required this.age,
    required this.garageOwnerImage,
    required this.garageOwnerName,
  });

  @override
  List<Object> get props =>
      [
        garageOwnerName,
        email,
        password,
        garageOwnerImage,
        garageOwnerId,
        phoneNumber,
        age,
      ];
}
