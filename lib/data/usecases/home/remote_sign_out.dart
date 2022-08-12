import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_filmes/domain/usecases/home/sign_out.dart';

class RemoteSignOut extends SignOut {
  RemoteSignOut({
    required this.firebaseAuth,
  });

  FirebaseAuth firebaseAuth;

  @override
  Future<void> execute() async {
    await firebaseAuth.signOut();
  }
}
