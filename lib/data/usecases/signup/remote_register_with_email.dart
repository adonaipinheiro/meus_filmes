import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_filmes/domain/usecases/signup/register_with_email.dart';

class RemoteRegisterWithEmail extends RegisterWithEmail {
  RemoteRegisterWithEmail({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore;

  @override
  Future<User?> execute(
      {required String email,
      required String password,
      required String fullName}) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final users = firebaseFirestore.collection('users');

      users.doc(userCredential.user?.uid).set({
        'full_name': fullName,
        'email': email,
        'uuid': userCredential.user?.uid
      });

      return userCredential.user;
    } catch (error) {
      return null;
    }
  }
}
