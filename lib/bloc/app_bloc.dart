import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_flutter/bloc/app_events.dart';
import 'package:spacex_flutter/bloc/app_states.dart';
import 'package:spacex_flutter/product/repository/app_repository.dart';

class AppBloc extends Bloc<AppEvents, AppStates> {
  final AppRepository appRepository;

  AppBloc(this.appRepository) : super(AppLoadingState()) {
    on<LoadAppData>((event, emit) {
      emit(AppLoadingState());
      try {
        final spacexModel = appRepository.getLatestLaunch();
      } catch (e) {
        emit(AppErrorState(message: e.toString()));
      }
    });
  }
}
