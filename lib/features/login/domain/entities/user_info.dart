import 'package:equatable/equatable.dart';

class LoginInfo extends Equatable {
  final String? token;
  final String? tokenType;
  final UserInfo? userInfo;

  const LoginInfo({
    required this.token,
    required this.tokenType,
    required this.userInfo,
  });

  @override
  List<Object?> get props => [
        token,
        tokenType,
        userInfo,
      ];
}

class UserInfo extends Equatable {
  final String? name;
  final String? email;
  final String? gender;
  final String? mobileNo;
  final String? avatar;

  const UserInfo({
    required this.name,
    required this.email,
    required this.gender,
    required this.mobileNo,
    required this.avatar,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        gender,
        mobileNo,
        avatar,
      ];
}
