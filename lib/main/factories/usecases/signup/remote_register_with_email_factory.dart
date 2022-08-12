import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_filmes/data/usecases/signup/remote_register_with_email.dart';

RemoteRegisterWithEmail makeRemoteRegisterWithEmail() =>
    RemoteRegisterWithEmail(
      firebaseAuth: FirebaseAuth.instance,
      firebaseFirestore: FirebaseFirestore.instance,
    );
