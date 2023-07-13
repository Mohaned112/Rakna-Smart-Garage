import 'package:dartz/dartz.dart';
import 'package:rakna/domain/entities/user_data_entities.dart';

import '../../core/local_error/exceptions.dart';
import '../repository/base_parking_repository.dart';

class SignUpUserUseCase {
  final BaseParkingRepository baseParkingRepository;

  SignUpUserUseCase(this.baseParkingRepository);

  void postDio(String userName, int age, String email, String password,
      String confirmPassword, String phoneNumber) {
    baseParkingRepository.postDio(
        userName, age, email, password, confirmPassword, phoneNumber);
  }
}

class SignInUserUseCase {
  final BaseParkingRepository baseParkingRepository;

  SignInUserUseCase(this.baseParkingRepository);

  Future<Either<LocalException, List<UserData>>> call() async {
    return await baseParkingRepository.checkUserData();
  }
}
