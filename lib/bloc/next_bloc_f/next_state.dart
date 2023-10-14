import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:spacex_flutter/product/models/next_model.dart';

@immutable
abstract class NextStates extends Equatable {
  const NextStates();
}

class NextInitialState extends NextStates {
  @override
  List<Object?> get props => [];
}

//data loading
class NextLoadingState extends NextStates {
  @override
  List<Object?> get props => [];
}

//data loaded

class NextLoadedState extends NextStates {
  final List<NextLaunchModel> nextModel;

  const NextLoadedState(
    this.nextModel,
  );

  @override
  List<Object?> get props => [
        nextModel,
      ];
}

//data error

class NextErrorState extends NextStates {
  const NextErrorState(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
