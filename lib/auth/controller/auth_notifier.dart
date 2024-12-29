import 'dart:ffi';

import 'package:beco_coffee/auth/repo/auth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  String _fullName = '', _address = '';
  String? _email, _phone;

  @override
  FutureOr<User?> build() {
    return null;
  }

  Future<void> initUserCredentialForSignUp({
    required String fullName,
    String? email,
    String? phone,
    required String address,
  }) async {
    state = const AsyncLoading();

    final response = await ref.read(authRepoProvider).isEmailOrPhoneAvailable(
          email: email,
          phone: phone,
        );

    if (response) {
      _fullName = fullName;
      _email = email;
      _phone = phone;
      _address = address;
      state = const AsyncData(null);
    } else {
      state = AsyncError(
          const AuthException('email-already-in-use'), StackTrace.current);
    }
  }

  Future<void> signUp({
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () {
        if (_phone != null) {
          return ref.read(authRepoProvider).signUpWithPhone(
                fullName: _fullName,
                phone: _phone!,
                address: _address,
                password: password,
              );
        }

        return ref.read(authRepoProvider).signUpWithEmail(
              fullName: _fullName,
              email: _email!,
              password: password,
              address: _address,
            );
      },
    );
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(authRepoProvider).loginUser(email, password));
  }

  Future<void> logOut() async {
    state = const AsyncLoading();
    try {
      await ref.read(authRepoProvider).logOut();
      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
