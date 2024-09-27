import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';  

@Freezed()
class AuthUser with _$AuthUser {
  const factory AuthUser({
    @Default('') String id,
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String number,
    @Default('') String address,
    @Default('') String password,
    @Default('') String imageUrl,
  }) = _AuthUser;
}
