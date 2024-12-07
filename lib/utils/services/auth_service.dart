import 'package:ecommerce_app/features/auth/data/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String username,
  });
  Future<String> signIn({
    required String email,
    required String password,
  });
}
