import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_implement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepoImplement) : super(RegisterInitial());
  final AuthRepoImplement authRepoImplement;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      final result = await authRepoImplement.signUp(
        email: email.text,
        password: password.text,
        username: username.text,
      );
      result.fold(
        (failure) => emit(RegisterFailure(errorMessage: failure.message)),
        (userModel) => emit(
          RegisterSuccess(userModel: userModel),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    username.dispose();
    return super.close();
  }
}
