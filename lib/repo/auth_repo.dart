import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repo.g.dart';

class AuthRepo {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserCredential> signUpUserWithEmail({
    required String fullName,
    required String email,
    required String address,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCredential.user!.updateProfile(displayName: fullName);

    final documentRef =
        _firebaseFirestore.collection('users').doc(userCredential.user!.uid);

    await documentRef.set(
      {
        'fullName': fullName,
        'email': email,
        'address': address,
      },
    );

    return userCredential;
  }

  Future<bool> checkIfEmailIsAvailable(String email) async {
    final query = await _firebaseFirestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    return query.docs.isEmpty;
  }
}

@riverpod
AuthRepo authRepo(AuthRepoRef ref) {
  return AuthRepo();
}
