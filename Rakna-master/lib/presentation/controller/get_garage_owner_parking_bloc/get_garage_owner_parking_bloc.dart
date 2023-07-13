
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rakna/domain/usecase/get_garage_owner_parking_usecase.dart';

import '../../../core/utility/enums.dart';
import '../../../domain/entities/garage_owner_parking_data.dart';

part 'get_garage_owner_parking_event.dart';
part 'get_garage_owner_parking_state.dart';

class GetGarageOwnerParkingBloc extends Bloc<GarageOwnerParkingEvent, GarageOwnerParkingState> {
  final GetGarageOwnerParkingUseCase garageOwnerParkingUseCase;


  GetGarageOwnerParkingBloc({required this.garageOwnerParkingUseCase,required int garageOwnerId}) : super(const GarageOwnerParkingState()) {
    on<GarageOwnerParkingEvent>((event, emit) async {

      final result = await garageOwnerParkingUseCase.call(garageOwnerId:garageOwnerId );
      emit(
        const GarageOwnerParkingState(requestState: RequestState.loaded),
      );
      result.fold(
            (l) => emit(
              GarageOwnerParkingState(
            requestState: RequestState.error,
            message: l.statusMessage,
          ),
        ),
            (r) => emit(
              GarageOwnerParkingState(
            requestState: RequestState.loaded,
           parking: r,
          ),
        ),
      );
    });
  }
}
