import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/login&register/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/login&register/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SingleChildScrollView(
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
              const CustomTextField(
                prefixIcon: Icons.email,
                labelText: "Email",
              ),
              const CustomTextField(
                prefixIcon: Icons.lock_rounded,
                labelText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, kCategoriesView);
                },
                title: "LOGIN",
              ),
              const SizedBox(
                height: 25,
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
                      Navigator.pushNamed(context, kRegisterView);
                    },
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
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
    );
  }
}
