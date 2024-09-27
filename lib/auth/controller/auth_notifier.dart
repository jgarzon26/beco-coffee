import 'package:beco_coffee/auth/model/auth_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthUser> build() {
    return const AuthUser();
  }

  void initUserCredentialForSignUp({
    required String fullName,
    String? email,
    String? number,
    required String address,
  }) {
    state = AsyncData(state.value!.copyWith(
      fullName: fullName,
      email: email ?? '',
      number: number ?? '',
      address: address,
    ));
  }

  void SignUp({
    required String password,
  }) {
    state = AsyncData(state.value!.copyWith(
      password: password,
    ));
  }
}
