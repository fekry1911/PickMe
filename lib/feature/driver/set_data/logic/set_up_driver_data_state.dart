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
final class PickImageFile extends SetUpDriverDataState {
  final String link;
  PickImageFile(this.link);

  @override
  // TODO: implement props
  List<Object?> get props => [link];
}
final class ErrorPickImageFile extends SetUpDriverDataState {
  final String error;
  ErrorPickImageFile(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
final class SetCurrent extends SetUpDriverDataState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class PreviousStep extends SetUpDriverDataState {
  int step;
  PreviousStep({required this.step});
  @override
  // TODO: implement props
  List<Object?> get props => [step];
}

final class NextStep extends SetUpDriverDataState {
  final int step;
  NextStep(this.step);
  @override
  // TODO: implement props
  List<Object?> get props => [step];
}
final class LoadingImage extends SetUpDriverDataState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


