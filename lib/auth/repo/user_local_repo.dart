import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

part 'user_local_repo.g.dart';

class UserLocalRepo {
  final _asyncPrefs = SharedPreferencesAsync();

  Future<bool?> get getIsRememberUser {
    return _asyncPrefs.getBool('remember');
  }

  set setIsRememberUser(bool value) {
    _asyncPrefs.setBool('remember', value);
  }

  Future<Tuple2<String?, String?>> get getUser async {
    String? user = await _asyncPrefs.getString('user');
    String? password = await _asyncPrefs.getString('pass');

    return Tuple2(user, password);
  }

  Future<void> setUser(String user, String password) async {
    await _asyncPrefs.setString('user', user);
    await _asyncPrefs.setString('pass', password);
  }

  Future<void> removeUser() async {
    await _asyncPrefs.remove('user');
    await _asyncPrefs.remove('pass');
  }
}

@riverpod
UserLocalRepo userLocalRepo(UserLocalRepoRef ref) {
  return UserLocalRepo();
}
