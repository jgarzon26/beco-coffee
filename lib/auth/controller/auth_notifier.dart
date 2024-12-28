import 'package:beco_coffee/auth/repo/auth_repo.dart';
import 'package:beco_coffee/core/email_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  String _fullName = '', _email = '', _address = '';

  @override
  FutureOr<User?> build() {
    return null;
  }

  Future<void> initUserCredentialForSignUp({
    required String fullName,
    required String email,
    required String address,
  }) async {
    state = const AsyncLoading();
    final response = await ref.read(authRepoProvider).isEmailAvailable(email);
    if (response) {
      _fullName = fullName;
      _email = email;
      _address = address;
      state = const AsyncData(null);
    } else {
      state = AsyncError(
          EmailException('email-already-in-use'), StackTrace.current);
    }
  }

  Future<void> signUp({
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(authRepoProvider).signUpUserWithEmail(
              fullName: _fullName,
              email: _email,
              password: password,
              address: _address,
            ));
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
