import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/bloc/past_bloc_f/past_events.dart';
import 'package:spacex_flutter/bloc/past_bloc_f/past_state.dart';
import 'package:spacex_flutter/product/repository/past_repository.dart';

class PastBloc extends Bloc<PastEvents, PastStates> {
  final PastLaunchRepository _repository;
  PastBloc(this._repository) : super(PastLoadingState()) {
    on<LoadPastData>(
      (event, emit) async {
        emit(PastLoadingState());
        try {
          final model = await _repository.getPastLaunch();
          emit(PastLoadedState(model));
        } catch (e) {
          if (e is Exception) {
            emit(PastErrorState(e.toString()));
          } else {
            emit(PastErrorState('Beklenmeyen bir hata oluştu: $e'));
          }
        }
      },
    );
  }
}
