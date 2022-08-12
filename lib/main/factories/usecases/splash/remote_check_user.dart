import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_filmes/data/usecases/splash/remote_check_user.dart';

RemoteCheckUser makeRemoteCheckUser() => RemoteCheckUser(
      firebaseAuth: FirebaseAuth.instance,
    );
