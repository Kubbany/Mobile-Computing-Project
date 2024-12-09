import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_implement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepoImplement) : super(LoginCubitInitial());

  final AuthRepoImplement authRepoImplement;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      final result = await authRepoImplement.signIn(
        email: email.text,
        password: password.text,
      );
      result.fold(
        (failure) => emit(LoginFailure(errorMessage: failure.message)),
        (userModel) => emit(
          LoginSuccess(userModel: userModel),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
