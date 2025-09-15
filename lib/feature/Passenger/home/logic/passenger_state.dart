part of 'passenger_cubit.dart';

@immutable
sealed class PassengerState extends Equatable {}

final class PassengerInitial extends PassengerState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeIndex extends PassengerState {
  int index;

  ChangeIndex({required this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
