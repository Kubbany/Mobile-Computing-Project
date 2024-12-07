import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/utils/custom_exception.dart';
import 'package:ecommerce_app/utils/errors/failure.dart';
import 'package:ecommerce_app/utils/services/auth_service.dart';

class AuthRepoImplement {
  final AuthService authService;

  const AuthRepoImplement({required this.authService});
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserModel userModel =
          await authService.signIn(email: email, password: password);
      return right(userModel);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    } catch (e) {
      return left(ServerFailure("Try Again Later"));
    }
  }

  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      UserModel userModel = await authService.signUp(
          email: email, password: password, username: username);
      return right(userModel);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    } catch (e) {
      return left(ServerFailure("Try Again Later"));
    }
  }
}
