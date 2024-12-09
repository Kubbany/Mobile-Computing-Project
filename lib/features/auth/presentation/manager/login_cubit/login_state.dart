part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginCubitInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

final class LoginSuccess extends LoginState {
  final UserModel userModel;

  LoginSuccess({required this.userModel});
}
