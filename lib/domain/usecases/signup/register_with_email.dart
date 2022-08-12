import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterWithEmail {
  Future<User?> execute({
    required String email,
    required String fullName,
    required String password,
  });
}
