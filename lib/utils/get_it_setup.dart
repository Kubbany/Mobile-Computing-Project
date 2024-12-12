import 'package:ecommerce_app/features/admin/data/repos/categories_repo.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_implement.dart';
import 'package:ecommerce_app/utils/services/auth_service.dart';
import 'package:ecommerce_app/utils/services/database_service.dart';
import 'package:ecommerce_app/utils/services/firebase_auth_service.dart';
import 'package:ecommerce_app/utils/services/firebase_database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;
Future<void> getItSetup() async {
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  getIt.registerLazySingleton<AuthService>(
    () => FirebaseAuthService(),
  );
  getIt.registerLazySingleton<DatabaseService>(
    () => FirebaseDatabaseService(),
  );
  getIt.registerLazySingleton<AuthRepoImplement>(
    () => AuthRepoImplement(
      authService: getIt<AuthService>(),
    ),
  );
  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepo(
      databaseService: getIt<DatabaseService>(),
    ),
  );

  await getIt.allReady();
}
