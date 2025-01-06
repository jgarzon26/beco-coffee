import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

part 'user_local_repo.g.dart';

class UserLocalRepo {
  final _asyncPrefs = SharedPreferencesAsync();

  static const _userKey = 'user', _passKey = 'pass', _rememberKey = 'remember';

  Future<bool?> getIsRememberUser() {
    return _asyncPrefs.getBool(_rememberKey);
  }

  void setIsRememberUser(bool value) {
    _asyncPrefs.setBool(_rememberKey, value);
  }

  Future<Tuple2<String?, String?>> getUser() async {
    String? user = await _asyncPrefs.getString(_userKey);
    String? password = await _asyncPrefs.getString(_passKey);

    return Tuple2(user, password);
  }

  Future<void> setUser(String user, String password) async {
    await _asyncPrefs.setString(_userKey, user);
    await _asyncPrefs.setString(_passKey, password);
  }

  Future<void> removeUser() async {
    await _asyncPrefs.remove(_userKey);
    await _asyncPrefs.remove(_passKey);
  }
}

@riverpod
UserLocalRepo userLocalRepo(UserLocalRepoRef ref) {
  return UserLocalRepo();
}
