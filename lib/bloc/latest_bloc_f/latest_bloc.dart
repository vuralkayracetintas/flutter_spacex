import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/bloc/latest_bloc_f/lates_events.dart';
import 'package:spacex_flutter/bloc/latest_bloc_f/lates_states.dart';
import 'package:spacex_flutter/product/repository/spacex_repository.dart';

class SpacexBloc extends Bloc<SpacexEvents, SpacexStates> {
  final SpacexRepository _spacexRepository;

  SpacexBloc(this._spacexRepository) : super(SpacexLoadingState()) {
    on<LoadSpacexData>(
      (event, emit) async {
        emit(SpacexLoadingState());
        try {
          final spacexModel = await _spacexRepository.getLatestLaunch();

          emit(SpacexLoadedState(spacexModel));
        } catch (e) {
          if (e is Exception) {
            emit(SpacexErrorState(e.toString()));
          } else {
            emit(SpacexErrorState('Beklenmeyen bir hata oluştu: $e'));
          }
        }
      },
    );
  }
}
