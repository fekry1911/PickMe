part of 'type_drivers_cubit.dart';

@immutable
sealed class TypeDriversState extends Equatable {}

final class TypeDriversInitial extends TypeDriversState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class GetAllDriversType extends TypeDriversState {
  final List<UserModel> drivers;
  GetAllDriversType({required this.drivers});
  @override
  // TODO: implement props
  List<Object?> get props => [drivers];
}
final class TypeDriversLoading extends TypeDriversState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class TypeDriversEmpty extends TypeDriversState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class TypeDriversError extends TypeDriversState {
  final String error;

  TypeDriversError({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
