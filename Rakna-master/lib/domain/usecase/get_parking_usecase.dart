import 'package:dartz/dartz.dart';
import 'package:rakna/domain/repository/base_parking_repository.dart';

import '../../core/local_error/exceptions.dart';
import '../entities/parking.dart';

class GetParkingUseCase {
  final BaseParkingRepository baseParkingRepository;

  GetParkingUseCase(this.baseParkingRepository);

  Future<Either<LocalException, List<Parking>>> call() async {
    return await baseParkingRepository.getParking();
  }
}
