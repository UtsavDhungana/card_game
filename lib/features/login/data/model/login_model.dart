import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user_info.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends LoginInfo {
  @JsonKey(name: 'access_token')
  final String? token;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'user')
  final UserModel? userInfo;

  const LoginModel({
    required this.token,
    required this.tokenType,
    required this.userInfo,
  }) : super(
          token: token,
          tokenType: tokenType,
          userInfo: userInfo,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  // LoginModel copyWith({
  //   String? token,
  //   String? tokenType,
  //   UserModel? userInfo,
  // }) {
  //   return LoginModel(
  //     token: token ?? this.token,
  //     tokenType: tokenType ?? this.tokenType,
  //     userInfo: userInfo ?? this.userInfo,
  //   );
  // }
}

@JsonSerializable()
class UserModel extends UserInfo {
  final String? name;
  final String? email;
  final String? gender;
  @JsonKey(name: 'mobile_no')
  final String? mobileNo;
  final String? avatar;

  const UserModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.mobileNo,
    required this.avatar,
  }) : super(
          name: name,
          email: email,
          gender: gender,
          mobileNo: mobileNo,
          avatar: avatar,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // UserModel copyWith({
  //   int? id,
  //   int? totalCreditPoints,
  //   String? name,
  //   String? email,
  //   String? username,
  //   String? phone,
  //   int? roleId,
  //   RoleModel? role,
  // }) {
  //   return UserModel(
  //     id: id ?? this.id,
  //     totalCreditPoints: totalCreditPoints ?? this.totalCreditPoints,
  //     name: name ?? this.name,
  //     email: email ?? this.email,
  //     username: username ?? this.username,
  //     phone: phone ?? this.phone,
  //     roleId: roleId ?? this.roleId,
  //     role: role ?? this.role,
  //   );
  // }
}
