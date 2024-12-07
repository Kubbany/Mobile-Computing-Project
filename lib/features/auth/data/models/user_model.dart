import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String username;
  final String email;
  final String id;

  const UserModel({
    required this.username,
    required this.email,
    required this.id,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      username: user.displayName ?? "",
      email: user.email ?? "",
      id: user.uid,
    );
  }
}
