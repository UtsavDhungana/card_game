part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.loaded({
    required final LoginInfo loginInfo,
  }) = _Loaded;
  const factory LoginState.failed({required Failure failure}) = _Failed;
}
