import 'package:dartz/dartz.dart';
import 'package:rakna/core/local_error/exceptions.dart';
import 'package:rakna/domain/entities/garage_owner_data.dart';
import 'package:rakna/domain/entities/garage_owner_parking_data.dart';
import 'package:rakna/domain/entities/parking.dart';
import 'package:rakna/domain/entities/parking_slot_entities.dart';
import 'package:rakna/domain/entities/user_data_entities.dart';
import 'package:rakna/domain/repository/base_parking_repository.dart';

import '../data_source/remote_data_source.dart';

class ParkingRepository extends BaseParkingRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  ParkingRepository(this.baseRemoteDataSource);

  @override
  Future<Either<LocalException, List<Parking>>> getParking() async {
    final result = await baseRemoteDataSource.getParking();
    try {
      return Right(result);
    } on LocalException catch (e) {
      return left(LocalException(
          statusMessage: 'Error imp repository', success: false));
    }
  }
  @override
  Future<Either<LocalException, List<ParkingSlot>>> getParkingSlot(int parkId) async{
    final result = await baseRemoteDataSource.getParkingSlot(parkId);
    try {
      return Right(result);
    } on LocalException catch (e) {
      return left(LocalException(
          statusMessage: 'Error imp repository', success: false));
    }
  }

  @override
  void postDio(String userName, int age, String email, String password,
      String confirmPassword, String phoneNumber) {
    baseRemoteDataSource.postSignUp(
        userName: userName,
        age: age,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: phoneNumber);
  }

  @override
  Future<Either<LocalException, List<UserData>>> checkUserData()async {
    final result = await baseRemoteDataSource.checkUserData();
    try {
      return Right(result);
    } on LocalException catch (e) {
      return left(LocalException(
          statusMessage: 'Error imp repository', success: false));
    }
  }

  @override
  Future<Either<LocalException, List<GarageOwnerData>>> checkGarageOwnerData() async{
    final result = await baseRemoteDataSource.checkGarageOwnerData();
    try {
      return Right(result);
    } on LocalException catch (e) {
      return left(LocalException(
          statusMessage: 'Error imp repository', success: false));
    }
  }

  @override
  Future<Either<LocalException, List<GarageOwnerParking>>> getGarageOwnerParking(int garageOwnerId) async{
    final result = await baseRemoteDataSource.getParkingGarageOwner(garageOwnerId);
    try {
      return Right(result);
    } on LocalException catch (e) {
      return left(LocalException(
          statusMessage: 'Error imp repository', success: false));
    }
  }




}
