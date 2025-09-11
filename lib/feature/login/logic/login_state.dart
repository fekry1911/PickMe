part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable {}

final class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

final class LoginFailure extends LoginState {
  final String error;
  final DateTime timestamp;

  LoginFailure(this.error) : timestamp = DateTime.now();

  @override
  List<Object?> get props => [error, timestamp];
}
final class GetDataSuccess extends LoginState {
  final UserModel user;

  GetDataSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

final class GetUserDataFailure extends LoginState {
  final String error;
  final DateTime timestamp;

  GetUserDataFailure(this.error) : timestamp = DateTime.now();

  @override
  List<Object?> get props => [error, timestamp];
}

