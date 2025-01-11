import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repo.g.dart';

class AuthRepo {
  final supabase = Supabase.instance.client;

  Future<User?> signUpWithEmail({
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
    await _updateUserInfo(
      userId: authResponse.user!.id,
      address: address,
      fullName: fullName,
      email: email,
    );

    return authResponse.user;
  }

  Future<User?> signUpWithPhone({
    required String fullName,
    required String phone,
    required String address,
    required String password,
  }) async {
    //Sign up with phone number
    final authResponse = await supabase.auth.signUp(
      phone: phone,
      password: password,
    );

    //update user info
    await _updateUserInfo(
      userId: authResponse.user!.id,
      address: address,
      fullName: fullName,
      phone: phone,
    );

    return authResponse.user;
  }

  Future _updateUserInfo({
    required String userId,
    required String address,
    required String fullName,
    String? email,
    String? phone,
  }) {
    return supabase.from('users').insert({
      'user_id': userId,
      'email': email,
      'full_name': fullName,
      'address': address,
      'phone_number': phone,
    });
  }

  /*Either input the email or phone, not both*/
  Future<bool> isEmailOrPhoneAvailable({
    String? email,
    String? phone,
  }) async {
    List users;

    if (email != null) {
      users = await supabase.from('users').select().eq('email', email);
      return users.isEmpty;
    } else if (phone != null) {
      users = await supabase.from('users').select().eq('phone_number', phone);
      return users.isEmpty;
    }

    return false;
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
