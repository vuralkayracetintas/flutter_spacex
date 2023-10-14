import 'package:equatable/equatable.dart';

abstract class PastEvents extends Equatable {
  const PastEvents();
}

class LoadPastData extends PastEvents {
  @override
  List<Object?> get props => [];
}
