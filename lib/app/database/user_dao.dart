import 'package:injectable/injectable.dart';
import 'package:silk_innovation_utsav/app/database/secure_storage.dart';

import '../../features/login/data/model/login_model.dart';

@LazySingleton()
class UserDao {
  final SecureStorage _secureStorage;

  UserDao(this._secureStorage);

  Future<void> saveToken(String token) async {
    await _secureStorage.saveCookies(token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.getCookies();
  }

  Future<void> saveUserDetails(
    LoginModel userInfoModel,
  ) async {
    await _secureStorage.saveUserInfo(userInfoModel);
  }

  Future<LoginModel?> getUserDetails() async {
    return await _secureStorage.getUserInfo();
  }

  Future<void> clear() async {
    // await _secureStorage.deleteUserInfo();
    await _secureStorage.clearCookies();
    _secureStorage.clear();
  }
}
