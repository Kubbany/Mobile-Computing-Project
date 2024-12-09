import 'package:ecommerce_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';

import 'package:ecommerce_app/features/auth/presentation/views/register_view.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/home/presentation/views/categories_view.dart';
import 'package:ecommerce_app/utils/loading_overlay_blured.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CategoriesView(),
            ),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return LoadingOverlayBlured(
          isLoading: state is LoginLoading,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: context.read<LoginCubit>().formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 90,
                        child: Image.asset("assets/images/ecommerce.png"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CustomTextField(
                        textEditingController: context.read<LoginCubit>().email,
                        prefixIcon: Icons.email,
                        labelText: "Email",
                      ),
                      CustomTextField(
                        textEditingController:
                            context.read<LoginCubit>().password,
                        prefixIcon: Icons.lock_rounded,
                        labelText: "Password",
                        isPasswordField: true,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          context.read<LoginCubit>().login();
                        },
                        title: "LOGIN",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text(
                            "Remember Me",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have An Account?",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterView.id);
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
