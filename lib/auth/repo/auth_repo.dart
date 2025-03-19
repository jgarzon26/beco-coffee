import 'package:beco_coffee/auth/model/coffee_user.dart';
import 'package:beco_coffee/auth/model/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repo.g.dart';

class AuthRepo {
  final supabase = Supabase.instance.client;

  //Auth Functions

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
    await _insertUserInfo(
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
    await _insertUserInfo(
      userId: authResponse.user!.id,
      address: address,
      fullName: fullName,
      phone: phone,
    );

    return authResponse.user;
  }

  Future _insertUserInfo({
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

  User? get isLogin {
    return supabase.auth.currentUser;
  }

  /*assumes that user is logged in, otherwise will throw an error*/
  User get currentUser {
    final user = supabase.auth.currentUser;

    if (user == null) {
      throw Exception('User is not logged in');
    }

    return user;
  }

  Future<void> logOut() async {
    return supabase.auth.signOut();
  }

  //User Profiles

  Future<UserProfile> get currentUserProfile async {
    final user = currentUser;

    final response =
        await supabase.from('users').select().eq('user_id', user.id);

    return UserProfile.fromMap(response[0]);
  }

  Future<CoffeeUser> updateUserProfile(UserProfile userProfile) async {
    final updatedUser = await supabase.auth.updateUser(UserAttributes(
      email: userProfile.email,
      phone: userProfile.phone,
    ));

    final updatedUserProfile = await supabase
        .from('users')
        .update(userProfile.toMap())
        .eq('user_id', currentUser.id)
        .select();

    return CoffeeUser(
        user: updatedUser.user!,
        userProfile: UserProfile.fromMap(updatedUserProfile[0]));
  }

  Future<void> updatePassword(String password) async {
    await supabase.auth.updateUser(
      UserAttributes(
        password: password,
      ),
    );
  }

  //this returns list of coffee Ids
  Future<List<String>> getUserSearchQueries() async {
    final currentUser = this.currentUser;
    final searchQueriesRes = await supabase
        .from('users')
        .select('search_queries')
        .eq('user_id', currentUser.id);

    final List<dynamic> searchQueries =
        searchQueriesRes[0]['search_queries'] ?? [];

    if (searchQueries.isEmpty) {
      return [];
    }

    /*
      converting dynamic to string
    */

    final actualSearchQueries = searchQueries.map(
      (query) {
        return query.toString();
      },
    ).toList();

    return actualSearchQueries;
  }

  Future<List<String>> updateSearchQueries(List<String> coffeeIds) async {
    final currentUser = this.currentUser;

    final res = await supabase
        .from('users')
        .update({'search_queries': coffeeIds})
        .eq('user_id', currentUser.id)
        .select();

    final List<dynamic> searchQueries = res[0]['search_queries'] ?? [];

    if (searchQueries.isEmpty) {
      return [];
    }

    final updatedSearchQueries = searchQueries.map(
      (query) {
        return query.toString();
      },
    ).toList();

    return updatedSearchQueries;
  }

  Future<List<String>> getUserWishList() async {
    final user = currentUser;

    final List<dynamic> userWishListIds = (await supabase
            .from('users')
            .select('wishlists')
            .eq('user_id', user.id))[0]['wishlists'] ??
        [];

    return userWishListIds
        .map(
          (e) => e.toString(),
        )
        .toList();
  }

  Future<List<String>> updateCoffeeWishList(List<String> coffeeIDs) async {
    final user = currentUser;

    await supabase.from('users').update({
      'wishlists': coffeeIDs,
    }).eq('user_id', user.id);

    return getUserWishList();
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
