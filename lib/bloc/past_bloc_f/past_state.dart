import 'package:equatable/equatable.dart';

import 'package:spacex_flutter/product/models/past_model.dart';

abstract class PastStates extends Equatable {
  const PastStates();
}

class PastInitialState extends PastStates {
  @override
  List<Object?> get props => [];
}

//data loading
class PastLoadingState extends PastStates {
  @override
  List<Object?> get props => [];
}

//data loaded
class PastLoadedState extends PastStates {
  final List<PastLaunchModel> pastModel;

  const PastLoadedState(this.pastModel);

  @override
  List<Object?> get props => [
        pastModel,
      ];
}

class PastErrorState extends PastStates {
  final String message;

  const PastErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
