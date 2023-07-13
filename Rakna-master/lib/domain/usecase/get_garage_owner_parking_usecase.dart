import 'package:dartz/dartz.dart';
import 'package:rakna/domain/entities/garage_owner_parking_data.dart';

import '../../core/local_error/exceptions.dart';
import '../repository/base_parking_repository.dart';

class GetGarageOwnerParkingUseCase {
  final BaseParkingRepository baseParkingRepository;

  GetGarageOwnerParkingUseCase( this.baseParkingRepository);

  Future<Either<LocalException, List<GarageOwnerParking>>> call({required int garageOwnerId}) async {
    return baseParkingRepository.getGarageOwnerParking(garageOwnerId);
  }
}