part of 'registeration_cubit.dart';

@immutable
sealed class RegisterState extends Equatable {}

final class RegisterationInitial extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
final class RegisterationLoading extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
final class RegisterationSuccess extends RegisterState {
  UserModel userModel;
  RegisterationSuccess(this.userModel);
  @override
  // TODO: implement props
  List<Object?> get props =>[userModel];
}
final class RegisterationError extends RegisterState {
  String errorMessage;
  final DateTime timestamp;

  RegisterationError(this.errorMessage) : timestamp = DateTime.now();

  @override
  // TODO: implement props
  List<Object?> get props =>[errorMessage,timestamp];
}
final class SaveDataError extends RegisterState {
  String errorMessage;
  final DateTime timestamp;

  SaveDataError(this.errorMessage) : timestamp = DateTime.now();

  @override
  // TODO: implement props
  List<Object?> get props =>[errorMessage,timestamp];
}
final class ChangeType extends RegisterState {
  final String type;
  ChangeType(this.type);
  @override
  // TODO: implement props
  List<Object?> get props => [type];
}
final class ChangePasswordVisibility extends RegisterState {
  final bool isObscureText;
  ChangePasswordVisibility(this.isObscureText);
  @override
  // TODO: implement props
  List<Object?> get props =>[isObscureText];
}

