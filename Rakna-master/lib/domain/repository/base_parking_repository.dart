import 'package:dartz/dartz.dart';
import 'package:rakna/domain/entities/garage_owner_data.dart';
import 'package:rakna/domain/entities/parking_slot_entities.dart';
import 'package:rakna/domain/entities/user_data_entities.dart';

import '../../core/local_error/exceptions.dart';
import '../entities/garage_owner_parking_data.dart';
import '../entities/parking.dart';

abstract class BaseParkingRepository {
  Future<Either<LocalException, List<Parking>>> getParking();

  Future<Either<LocalException, List<GarageOwnerParking>>> getGarageOwnerParking(int garageOwnerId);

  Future<Either<LocalException, List<ParkingSlot>>> getParkingSlot(int parkId);

  Future<Either<LocalException, List<UserData>>> checkUserData();

  Future<Either<LocalException, List<GarageOwnerData>>> checkGarageOwnerData();

  void postDio(String userName, int age, String email, String password,
      String confirmPassword, String phoneNumber);
}
