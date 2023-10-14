import 'package:equatable/equatable.dart';

abstract class NextEvents extends Equatable {
  const NextEvents();
}

class LoadNextData extends NextEvents {
  @override
  List<Object?> get props => [];
}
