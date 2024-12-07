import 'package:ecommerce_app/features/auth/data/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String username,
  });
  Future<UserModel> signIn({
    required String email,
    required String password,
  });
}
