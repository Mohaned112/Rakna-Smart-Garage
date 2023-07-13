import 'package:dartz/dartz.dart';
import 'package:rakna/domain/entities/parking_slot_entities.dart';
import 'package:rakna/domain/repository/base_parking_repository.dart';

import '../../core/local_error/exceptions.dart';

class GetParkingSlotUseCase {
  final BaseParkingRepository baseParkingRepository;

  GetParkingSlotUseCase( this.baseParkingRepository);

  Future<Either<LocalException, List<ParkingSlot>>> call({required int parkId}) async {
    return baseParkingRepository.getParkingSlot(parkId);
  }
}
