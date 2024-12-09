// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';

import 'package:ecommerce_app/features/auth/presentation/views/register_view.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/home/presentation/views/categories_view.dart';
import 'package:ecommerce_app/utils/loading_overlay_blured.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const PasswordRecvoeryDialog();
                                });
                          },
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

class PasswordRecvoeryDialog extends StatefulWidget {
  const PasswordRecvoeryDialog({
    super.key,
  });

  @override
  State<PasswordRecvoeryDialog> createState() => _PasswordRecvoeryDialogState();
}

class _PasswordRecvoeryDialogState extends State<PasswordRecvoeryDialog> {
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingOverlayBlured(
        isLoading: isLoading,
        child: AlertDialog(
          title: const Text("Password Recovery"),
          content: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Enter Your Email To Send Recovery Link",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                CustomTextField(
                  textEditingController: textEditingController,
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
                  labelText: "Email",
                  prefixIcon: Icons.email,
                ),
              ],
            ),
          ),
          actions: [
            CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  isLoading = true;
                  setState(() {});
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                      email: textEditingController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Email Was Sent",
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  } on Exception catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          e.toString(),
                        ),
                      ),
                    );
                  }
                  isLoading = false;
                  setState(() {});
                }
              },
              title: "Send",
            ),
          ],
        ),
      ),
    );
  }
}
