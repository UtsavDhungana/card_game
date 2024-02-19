import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/data/base_remote_data_source.dart';
import '../../../../../core/data/utils.dart';
import '../model/login_model.dart';

@LazySingleton()
class LoginRemoteDataSource extends BaseRemoteDataSourceImpl {
  LoginRemoteDataSource(
    super.client,
    super.userDao,
  );

  Future<LoginModel> loginUser(
    String emailOrMobileNo,
    String password,
    String fcmToken,
    String pin,
    bool isPin,
  ) async {
    final response = await performPostRequest(
      ApiEndpoints.loginUrl,
      isPin
          ? {
              "mobile_no": emailOrMobileNo,
              "pin": pin,
              "fcmToken": fcmToken,
            }
          : {
              "mobile_no": emailOrMobileNo,
              "password": password,
              "fcmToken": fcmToken,
            },
      {
        'App-Authorizer': '647061697361',
        'Accept': 'application/json',
      },
    );
    log(response.body);
    final data = decodeBodyAndThrowPossibleException(response);
    final loginResponse = LoginModel.fromJson(
      data,
    );
    await userDao.saveToken(loginResponse.token ?? '');
    await userDao.saveUserDetails(loginResponse);
    return loginResponse;
  }
}
