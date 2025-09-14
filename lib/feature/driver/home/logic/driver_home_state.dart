part of 'driver_home_cubit.dart';

@immutable
sealed class DriverHomeState extends Equatable {}

final class DriverHomeInitial extends DriverHomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeIndex extends DriverHomeState {
  int index;
  ChangeIndex({required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [index];

}