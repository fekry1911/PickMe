part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable {}

final class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
final class LoginSuccess extends LoginState {
  final User user;
  LoginSuccess(this.user);
  @override
  List<Object?> get props => [user];
}
final class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
  @override
  List<Object?> get props => [error];
  @override
  String toString() {
    return 'LoginFailure{error: $error}';
  }
}

