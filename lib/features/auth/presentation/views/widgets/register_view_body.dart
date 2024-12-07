import 'package:ecommerce_app/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/date_of_birth_field.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
              const CustomTextField(
                prefixIcon: Icons.email,
                labelText: "Email",
              ),
              const CustomTextField(
                prefixIcon: Icons.person,
                labelText: "Username",
              ),
              const CustomTextField(
                prefixIcon: Icons.lock_rounded,
                labelText: "Password",
                isPasswordField: true,
              ),
              const CustomTextField(
                prefixIcon: Icons.lock_rounded,
                labelText: "Confirm Password",
                isPasswordField: true,
              ),
              const DateOfBirthField(),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {},
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
    );
  }
}
