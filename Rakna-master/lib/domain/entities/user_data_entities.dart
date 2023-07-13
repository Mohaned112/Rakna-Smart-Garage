import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String userName;
  final String email;
  final String password;
  final String userImage;
  final String phoneNumber;
  final int userID;
  final int age;

  const UserData({
    required this.userName,
    required this.email,
    required this.password,
    required this.userImage,
    required this.age,
    required this.phoneNumber,
    required this.userID,
  });

  @override
  List<Object> get props =>
      [userName, email, password, userImage, userID, phoneNumber, age,];
}
