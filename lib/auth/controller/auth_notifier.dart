import 'package:beco_coffee/auth/model/coffee_user.dart';
import 'package:beco_coffee/auth/model/user_profile.dart';
import 'package:beco_coffee/auth/repo/auth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  String _fullName = '', _address = '';
  String? _email, _phone;

  @override
  FutureOr<CoffeeUser?> build() async {
    if (ref.read(authRepoProvider).currentUser != null) {
      final user = ref.read(authRepoProvider).currentUser;
      final userProfile = await ref.read(authRepoProvider).currentUserProfile;
      return CoffeeUser(user: user!, userProfile: userProfile);
    }

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

    User? response;

    try {
      if (_phone != null) {
        response = await ref.read(authRepoProvider).signUpWithPhone(
              fullName: _fullName,
              phone: _phone!,
              address: _address,
              password: password,
            );
      } else {
        response = await ref.read(authRepoProvider).signUpWithEmail(
              fullName: _fullName,
              email: _email!,
              password: password,
              address: _address,
            );
      }

      final userProfile = await ref.read(authRepoProvider).currentUserProfile;

      state = AsyncData(
        CoffeeUser(
          user: response!,
          userProfile: userProfile,
        ),
      );
    } catch (error, s) {
      state = AsyncError(error, s);
    }
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      final user = await ref.read(authRepoProvider).loginUser(
            email,
            password,
          );
      final userProfile = await ref.read(authRepoProvider).currentUserProfile;

      state = AsyncData(
        CoffeeUser(user: user!, userProfile: userProfile),
      );
    } catch (error, s) {
      state = AsyncError(error, s);
    }
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
