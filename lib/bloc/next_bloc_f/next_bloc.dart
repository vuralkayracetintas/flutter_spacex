import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spacex_flutter/bloc/next_bloc_f/next_evets.dart';
import 'package:spacex_flutter/bloc/next_bloc_f/next_state.dart';
import 'package:spacex_flutter/product/repository/upcoming_repository.dart';

class NextBloc extends Bloc<NextEvents, NextStates> {
  final NextLaunchRepository _repository;
  NextBloc(this._repository) : super(NextLoadingState()) {
    on<LoadNextData>(
      (event, emit) async {
        emit(NextLoadingState());
        try {
          final model = await _repository.getNextLaunch();
          // final nextLaunch = await _Repository.getNextLaunch();
          emit(NextLoadedState(model));
        } catch (e) {
          if (e is Exception) {
            emit(NextErrorState(e.toString()));
          } else {
            emit(NextErrorState('Beklenmeyen bir hata oluştu: $e'));
          }
        }
      },
    );
  }
}
