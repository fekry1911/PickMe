part of 'set_up_driver_data_cubit.dart';

@immutable
sealed class SetUpDriverDataState extends Equatable {}

final class SetUpDriverDataInitial extends SetUpDriverDataState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class SetUpDriverDataLoading extends SetUpDriverDataState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class SetUpDriverDataSuccess extends SetUpDriverDataState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class SetUpDriverDataError extends SetUpDriverDataState {
  final String error;
  final DateTime timestamp;

  SetUpDriverDataError(this.error) : timestamp = DateTime.now();
  @override
  // TODO: implement props
  List<Object?> get props => [error,timestamp];
}

