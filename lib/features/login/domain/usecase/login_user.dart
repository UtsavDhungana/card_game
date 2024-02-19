import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entities/user_info.dart';
import '../repository/login_repository.dart';

@LazySingleton()
class LoginUser extends Usecase<LoginInfo, LoginParams> {
  final LoginRepository _loginRepository;
  LoginUser(this._loginRepository);

  @override
  Future<Either<Failure, LoginInfo>> call(LoginParams params) async {
    return await _loginRepository.loginUser(
      params.emailOrMobileNo,
      params.password,
      params.fcmToken,
      params.pin,
      params.isPin,
    );
  }
}

class LoginParams extends Equatable {
  final String emailOrMobileNo;
  final String password;
  final String fcmToken;
  final String pin;
  final bool isPin;

  const LoginParams({
    required this.emailOrMobileNo,
    required this.password,
    required this.fcmToken,
    required this.pin,
    required this.isPin,
  });

  @override
  List<Object> get props => [
        emailOrMobileNo,
        password,
        fcmToken,
        pin,
        isPin,
      ];
}
