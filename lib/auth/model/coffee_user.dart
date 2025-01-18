import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:beco_coffee/auth/model/user_profile.dart';

class CoffeeUser {
  final User user;
  final UserProfile userProfile;

  const CoffeeUser({
    required this.user,
    required this.userProfile,
  });

  CoffeeUser copyWith({
    User? user,
    UserProfile? userProfile,
  }) {
    return CoffeeUser(
      user: user ?? this.user,
      userProfile: userProfile ?? this.userProfile,
    );
  }
}
