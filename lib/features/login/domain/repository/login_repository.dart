import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/user_info.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginInfo>> loginUser(
    String emailOrMobileNo,
    String password,
    String fcmToken,
    String pin,
    bool isPin,
  );
}
