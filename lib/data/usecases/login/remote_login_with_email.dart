import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_filmes/domain/usecases/login/login_with_email.dart';

class RemoteLoginWithEmail extends LoginWithEmail {
  RemoteLoginWithEmail({
    required this.firebaseAuth,
  });

  FirebaseAuth firebaseAuth;

  @override
  Future<User?> execute(
      {required String email, required String password}) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (error) {
      return null;
    }
  }
}
