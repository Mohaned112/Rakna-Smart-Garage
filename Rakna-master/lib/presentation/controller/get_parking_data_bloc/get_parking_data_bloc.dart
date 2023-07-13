import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rakna/domain/usecase/get_parking_usecase.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utility/enums.dart';
import '../../../domain/entities/parking.dart';
import 'get_parking_data_state.dart';

part 'get_parking_data_event.dart';


class ParkingBloc extends Bloc<GetParkingDataEvent, ParkingState> {
  final GetParkingUseCase getParkingUseCase;

  ParkingBloc(this.getParkingUseCase)
      : super(const ParkingState()) {
    on<GetParkingDataEvent>((event, emit) async {

      final result = await getParkingUseCase.call();
      emit(
        const ParkingState(requestState: RequestState.loaded),
      );
      result.fold(
        (l) => emit(
          ParkingState(
            requestState: RequestState.error,
            message: l.statusMessage,
          ),
        ),
        (r) => emit(
          ParkingState(
            requestState: RequestState.loaded,
            parking: r,
          ),
        ),
      );
    });
  }
}
