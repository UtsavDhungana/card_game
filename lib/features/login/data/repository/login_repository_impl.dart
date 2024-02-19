import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/repository/login_repository.dart';
import '../data_source/login_remote_dara_source.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  final ErrorHandler errorHandler;

  LoginRepositoryImpl({
    required this.loginRemoteDataSource,
    required this.errorHandler,
  });

  @override
  Future<Either<Failure, LoginInfo>> loginUser(
    String emailOrMobileNo,
    String password,
    String fcmToken,
    String pin,
    bool isPin,
  ) async {
    return await errorHandler.errorHandler<LoginInfo>(
      loginRemoteDataSource.loginUser(
        emailOrMobileNo,
        password,
        fcmToken,
        pin,
        isPin,
      ),
    );
  }
}
