import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_filmes/data/usecases/home/remote_sign_out.dart';

RemoteSignOut makeRemoteSignOut() =>
    RemoteSignOut(firebaseAuth: FirebaseAuth.instance);
