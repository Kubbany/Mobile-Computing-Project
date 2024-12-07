import 'package:ecommerce_app/features/auth/data/user_model.dart';
import 'package:ecommerce_app/utils/custom_exception.dart';
import 'package:ecommerce_app/utils/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService extends AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuthService();
  @override
  Future<UserModel> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // Create user in Firebase Auth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        value.user?.updateDisplayName(username);
        return value;
      });
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        String uid = firebaseUser.uid;

        // Prepare the user data
        UserModel userModel = UserModel(
          id: uid,
          username: username,
          email: email,
          password: '',
        );

        return userModel;
      } else {
        throw FirebaseAuthException(
            code: 'ERROR_NULL_SIGNUP_USER', message: 'User Creation Failed.');
      }
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthException(e);
    } catch (e) {
      throw const CustomException('An Unknown Error Occurred.');
    }
  }

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      // Sign in the user with Firebase Auth
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        return firebaseUser.uid;
      } else {
        throw FirebaseAuthException(
            code: 'ERROR_NULL_SIGNIN_USER', message: 'User Login Failed.');
      }
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthException(e);
    } on CustomException catch (e) {
      throw CustomException(e.errorMessage);
    } catch (e) {
      throw const CustomException('An Unknown Error Occurred.');
    }
  }

  // Handle Errors
  CustomException _handleFirebaseAuthException(e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'weak-password':
          return const CustomException('Password Too Week.');

        case 'email-already-in-use':
          return const CustomException('Account Already Exists.');

        case 'invalid-email':
          return const CustomException('Email Address Is Invalid.');

        case 'ERROR_NULL_SIGNUP_USER':
          return const CustomException('User Creation Failed.');
        case 'ERROR_NULL_SIGNIN_USER':
          return const CustomException('User Login Failed.');

        case 'invalid-credential':
        case 'user-not-found':
        case 'wrong-password':
          return const CustomException('Invalid Email Or Password');

        default:
          return const CustomException('An Unknown Error Occurred');
      }
    } else {
      return const CustomException('An Unknown Error Occurred');
    }
  }
}
