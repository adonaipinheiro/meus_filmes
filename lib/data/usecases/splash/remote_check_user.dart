import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_filmes/domain/usecases/splash/check_user.dart';

class RemoteCheckUser extends CheckUser {
  RemoteCheckUser({
    required this.firebaseAuth,
  });

  FirebaseAuth firebaseAuth;

  @override
  User? execute() {
    User? user = firebaseAuth.currentUser;

    return user;
  }
}
