import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/login&register/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String id = kRegisterView;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterViewBody(),
    );
  }
}
