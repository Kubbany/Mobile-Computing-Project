import 'package:ecommerce_app/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/date_of_birth_field.dart';
import 'package:ecommerce_app/features/home/presentation/views/categories_view.dart';
import 'package:ecommerce_app/utils/loading_overlay_blured.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CategoriesView(),
            ),
          );
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return LoadingOverlayBlured(
          isLoading: state is RegisterLoading,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: context.read<RegisterCubit>().formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 90,
                        child: Image.asset("assets/images/ecommerce.png"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This Field Cannot Be Empty";
                          }
                          final emailRegex =
                              RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value)) {
                            return "Please Enter A Valid Email";
                          }
                          return null;
                        },
                        textEditingController:
                            context.read<RegisterCubit>().email,
                        prefixIcon: Icons.email,
                        labelText: "Email",
                      ),
                      CustomTextField(
                        textEditingController:
                            context.read<RegisterCubit>().username,
                        prefixIcon: Icons.person,
                        labelText: "Username",
                      ),
                      CustomTextField(
                        textEditingController:
                            context.read<RegisterCubit>().password,
                        prefixIcon: Icons.lock_rounded,
                        labelText: "Password",
                        isPasswordField: true,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This Filed Cannot Be Empty";
                          }
                          if (value !=
                              context.read<RegisterCubit>().password.text) {
                            return "Password Doesn't Match";
                          }
                          return null;
                        },
                        prefixIcon: Icons.lock_rounded,
                        labelText: "Confirm Password",
                        isPasswordField: true,
                      ),
                      const DateOfBirthField(),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        onPressed: () {
                          context.read<RegisterCubit>().register();
                        },
                        title: "REGISTER",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Have An Account?",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, LoginView.id);
                            },
                            child: const Text(
                              "LOGIN",
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
