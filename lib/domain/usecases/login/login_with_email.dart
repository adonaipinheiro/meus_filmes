import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginWithEmail {
  Future<User?> execute({
    required String email,
    required String password,
  });
}
