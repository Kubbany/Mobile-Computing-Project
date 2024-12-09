import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_implement.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String id = kRegisterView;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepoImplement>()),
      child: const Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
