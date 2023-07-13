import 'package:rakna/domain/entities/user_data_entities.dart';

class UserDataModel extends UserData {
  const UserDataModel({
    required super.email,
    required super.password, required super.userName, required super.userImage, required super.age, required super.phoneNumber, required super.userID,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        email: json['email'],
        password: json['password'], userName: json['userName'], userImage: json['userImage'], age: json['age'], phoneNumber: json['phoneNumber'], userID: json['userID'],
      );
}
