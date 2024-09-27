import 'package:beco_coffee/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  String _fullName = '', _email = '', _address = '';

  @override
  FutureOr<UserCredential?> build() {
    return null;
  }

  Future<void> initUserCredentialForSignUp({
    required String fullName,
    required String email,
    required String address,
  }) async {
    state = const AsyncLoading();
    final response =
        await ref.read(authRepoProvider).checkIfEmailIsAvailable(email);

    if (response) {
      _fullName = fullName;
      _email = email;
      _address = address;
    } else {
      state = AsyncError(
        FirebaseAuthException(code: 'email-already-in-use'),
        StackTrace.current,
      );
    }
  }

  Future<void> signUp({
    required String password,
  }) async {
    state = await AsyncValue.guard(
        () => ref.read(authRepoProvider).signUpUserWithEmail(
              fullName: _fullName,
              email: _email,
              password: password,
              address: _address,
            ));
  }
}
