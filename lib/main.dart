import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/login&register/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/login&register/presentation/views/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: kLoginView,
      routes: {
        kLoginView: (context) => const LoginView(),
        kRegisterView: (context) => const RegisterView(),
      },
    );
  }
}
