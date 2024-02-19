import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/database/secure_storage.dart';
import '../../../../app/database/user_dao.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/usecase/login_user.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@Singleton()
class LoginCubit extends Cubit<LoginState> {
  final LoginUser _usecase;
  final UserDao _userDao;
  LoginCubit(
    this._usecase,
    this._userDao,
  ) : super(
          const LoginState.initial(),
        );

  Future<void> setStateToLoaded() async {
    final localData = await SecureStorage().getUserInfo();
    emit(
      LoginState.loaded(
        loginInfo: LoginInfo(
          token: localData?.token,
          userInfo: localData?.userInfo,
          tokenType: localData?.tokenType,
        ),
      ),
    );
  }

  void loginUser(
    String emailOrMobileNo,
    String password,
    String fcmToken,
    String pin,
    bool isPin,
  ) async {
    emit(
      const LoginState.loading(),
    );
    final response = await _usecase.call(
      LoginParams(
        emailOrMobileNo: emailOrMobileNo,
        password: password,
        fcmToken: fcmToken,
        pin: pin,
        isPin: isPin,
      ),
    );

    response.fold(
      (failure) {
        emit(
          LoginState.failed(
            failure: failure,
          ),
        );
      },
      (loginResp) {
        emit(
          LoginState.loaded(
            loginInfo: loginResp,
          ),
        );
      },
    );
  }

  Future<bool> isLoggedIn() async {
    final appToken = await _userDao.getToken();
    if (appToken == null) {
      emit(
        const LoginState.initial(),
      );
      return false;
    } else {
      return true;
    }
  }

  void logOut() {
    _userDao.clear();
  }
}
