part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure({required this.errorMessage});
}

final class RegisterSuccess extends RegisterState {
  final UserModel userModel;

  RegisterSuccess({required this.userModel});
}
