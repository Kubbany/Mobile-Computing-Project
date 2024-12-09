import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/categories_view.dart';
import 'package:ecommerce_app/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/auth/presentation/views/register_view.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  getItSetup();
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
        kCategoriesView: (context) => const CategoriesView(),
        kCartView: (context) => const CartView(),
      },
    );
  }
}
