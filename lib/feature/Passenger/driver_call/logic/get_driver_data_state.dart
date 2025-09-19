part of 'get_driver_data_cubit.dart';

@immutable
sealed class GetDriverDataState extends Equatable {}

final class GetDriverDataInitial extends GetDriverDataState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class GetDriverDataLoading extends GetDriverDataState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class GetDriverDataSucc extends GetDriverDataState {
  DriverModel driverModel;
  GetDriverDataSucc(this.driverModel);
  @override
  // TODO: implement props
  List<Object?> get props => [driverModel];
}
final class GetDriverDataError extends GetDriverDataState {
  String error;
  GetDriverDataError(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
