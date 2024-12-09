import 'package:ecommerce_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({
    super.key,
  });

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: context.read<LoginCubit>().rememberMe,
          onChanged: (value) {
            context.read<LoginCubit>().rememberMe = value ?? false;
            setState(() {});
          },
        ),
        const Text(
          "Remember Me",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
