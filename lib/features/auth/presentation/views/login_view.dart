import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_implement.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = kLoginView;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepoImplement>()),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
