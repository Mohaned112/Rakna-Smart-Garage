import 'package:dartz/dartz.dart';

import '../../core/local_error/exceptions.dart';
import '../entities/garage_owner_data.dart';
import '../repository/base_parking_repository.dart';

class SignInGarageOwnerUseCase {
  final BaseParkingRepository baseParkingRepository;

  SignInGarageOwnerUseCase(this.baseParkingRepository);

  Future<Either<LocalException, List<GarageOwnerData>>> call() async {
    return await baseParkingRepository.checkGarageOwnerData();
  }
}

