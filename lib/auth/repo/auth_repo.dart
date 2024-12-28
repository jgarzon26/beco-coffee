import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repo.g.dart';

class AuthRepo {
  final supabase = Supabase.instance.client;

  Future<User?> signUpUserWithEmail({
    required String fullName,
    required String email,
    required String address,
    required String password,
  }) async {
    //sign up user with email and password
    final authResponse = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    //update user info
    await supabase.from('users').insert({
      'user_id': authResponse.user?.id,
      'email': email,
      'full_name': fullName,
      'address': address,
    });

    return authResponse.user;
  }

  Future<bool> isEmailAvailable(String email) async {
    final users = await supabase.from('users').select().eq('email', email);
    return users.isEmpty;
  }

  Future<User?> loginUser(String email, String password) async {
    final authResponse = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return authResponse.user;
  }

  Stream<AuthState> authStateChanges() {
    return supabase.auth.onAuthStateChange;
  }

  User? get currentUser {
    return supabase.auth.currentUser;
  }

  Future<void> logOut() async {
    return supabase.auth.signOut();
  }
}

@riverpod
AuthRepo authRepo(Ref ref) {
  return AuthRepo();
}

@riverpod
Stream<AuthState> authStateChanges(Ref ref) {
  return ref.watch(authRepoProvider).authStateChanges();
}
