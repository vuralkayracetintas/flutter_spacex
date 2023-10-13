import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spacex_flutter/product/models/spacex_latest_launch_model.dart';

@immutable
abstract class AppStates extends Equatable {
  AppStates();
}

class AppInitialState extends AppStates {
  AppInitialState();

  @override
  List<Object> get props => [];
}

// data loading state
class AppLoadingState extends AppStates {
  AppLoadingState();

  @override
  List<Object> get props => [];
}

// data loaded state
class AppLoadedState extends AppStates {
  final SpacexModel model;

  AppLoadedState({required this.model});

  @override
  List<Object> get props => [model];
}

// data error state

class AppErrorState extends AppStates {
  final String message;

  AppErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
