import 'package:ecommerce_app/features/auth/data/repos/auth_repo_implement.dart';
import 'package:ecommerce_app/utils/services/auth_service.dart';
import 'package:ecommerce_app/utils/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void getItSetup() {
  getIt.registerLazySingleton<AuthService>(
    () => FirebaseAuthService(),
  );

  getIt.registerLazySingleton<AuthRepoImplement>(
    () => AuthRepoImplement(
      authService: getIt<AuthService>(),
    ),
  );
}
